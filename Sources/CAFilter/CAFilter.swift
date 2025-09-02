//
//  CAFilter.swift
//  CAFilterBuiltins
//
//  Created by Quentin Fasquel on 31/08/2025.
//

import CoreImage
import CoreImage.CIFilterBuiltins

import QuartzCore

extension NSObject {
    public func getValue<T>(forKey key: String, type: T.Type, isType: () -> CFTypeID) -> T? {
        guard let object = value(forKey: key) as? AnyObject, CFGetTypeID(object) == isType() else {
            return nil
        }
        return unsafeBitCast(object, to: T.self)
    }
}

func Class(_ stringLiteral: StringLiteralType) -> AnyClass? {
    NSClassFromString(stringLiteral)
}

@dynamicMemberLookup
open class _CAFilter {
    package let instance: NSObject
    
    public init?(type: CAFilterType) {
        let filterClass = NSClassFromString("CAFilter") as? NSObject.Type
        let filter = filterClass?.perform(NSSelectorFromString("filterWithType:"), with: type.rawValue)
        guard let instance = filter?.takeUnretainedValue() as? NSObject else {
            return nil
        }
        self.instance = instance
    }
    
    @available(iOS, unavailable)
    @available(macOS 14,  *)
    public func inputKeys() -> [String] {
        instance.perform(NSSelectorFromString("inputKeys"))?.takeUnretainedValue() as? [String] ?? []
    }
    
    public func outputKeys() -> [String] {
        instance.perform(NSSelectorFromString("outputKeys"))?.takeUnretainedValue() as? [String] ?? []
    }
    
    public func attributes(forKeyPath keyPath: String) -> [String: Any]? {
        instance.perform(NSSelectorFromString("attributesForKeyPath:"), with: keyPath)?.takeUnretainedValue() as? [String: Any]
    }
    
    public func setDefaults() {
        instance.perform(NSSelectorFromString("setDefaults"))
    }

    public subscript<T>(dynamicMember member: String) -> T? {
        get {
            if T.self == CGImage.self {
                return instance.getValue(forKey: member, type: CGImage.self, isType: { CGImage.typeID }) as? T
            } else {
                return instance.value(forKey: member) as? T
            }
        }

        set {
            instance.setValue(newValue, forKey: member)
        }
    }
}

extension CALayer {
    public func setFilters(_ filters: [Any]) {
        self.filters = filters.map { ($0 as? _CAFilter)?.instance ?? $0 }
    }
}
