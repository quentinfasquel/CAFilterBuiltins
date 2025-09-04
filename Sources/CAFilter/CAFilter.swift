//
//  CAFilter.swift
//  CAFilterBuiltins
//
//  Created by Quentin Fasquel on 31/08/2025.
//

import CAFilterProxy
import QuartzCore

public typealias _CAFilter = CAFilterProxy

extension _CAFilter {

    package convenience init?(type: CAFilterType) {
        let filterClass = NSClassFromString("CAFilter") as? NSObject.Type
        let filter = filterClass?.perform(NSSelectorFromString("filterWithType:"), with: type.rawValue)
        guard let instance = filter?.takeUnretainedValue() as? NSObject else { return nil }
        self.init(target: instance)
    }
    
    // MARK: - macOS API
    
    @available(iOS, unavailable)
    @available(macOS 14,  *)
    public func attributesForKeyPath(_ keyPath: String) -> [String: Any]? {
        value(forKeyPath: keyPath) as? [String: Any]
    }

    @available(iOS, unavailable)
    @available(macOS 14,  *)
    public func inputKeys() -> [String] {
        value(forKeyPath: "inputKeys") as? [String] ?? []
    }
    
    // MARK: - KVC Fix for CGImage, etc.
    
    @_disfavoredOverload
    public func value<T>(forKey key: String) -> T? {
        if T.self == CGImage.self {
            return value(forKey: key, type: CGImage.self, isType: { CGImage.typeID }) as? T
        } else {
            return value(forKey: key) as? T
        }
    }
    
    private func value<T>(forKey key: String, type: T.Type, isType: () -> CFTypeID) -> T? {
        guard let object = value(forKey: key) as? AnyObject, CFGetTypeID(object) == isType() else {
            return nil
        }
        return unsafeBitCast(object, to: T.self)
    }
}
