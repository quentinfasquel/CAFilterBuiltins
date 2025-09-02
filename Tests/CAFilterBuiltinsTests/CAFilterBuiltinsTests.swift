import CoreGraphics
import CoreImage
import Testing
@testable import CAFilterBuiltins

import Foundation
import ObjectiveC.runtime
import SwiftUI

func dumpObjCClassInfo(_ className: String) {
    guard let cls: AnyClass = NSClassFromString(className) else {
        print("⚠️ Class \(className) not found")
        return
    }
    print("🔎 Introspecting \(className)\n")

    // MARK: - Properties
    var propCount: UInt32 = 0
    if let properties = class_copyPropertyList(cls, &propCount) {
        print("📐 Properties:")
        for i in 0..<Int(propCount) {
            let property = properties[i]
            let name = String(property_getName(property))
            let attrs = String(property_getAttributes(property))
            print("  • \(name) (\(attrs))")
        }
        free(properties)
    } else {
        print("📐 No properties found")
    }
    print("")

    // MARK: - Ivars
    var ivarCount: UInt32 = 0
    if let ivars = class_copyIvarList(cls, &ivarCount) {
        print("📦 Ivars:")
        for i in 0..<Int(ivarCount) {
            let ivar = ivars[i]
            let name = String(ivar_getName(ivar))
            let type = String(ivar_getTypeEncoding(ivar))
            print("  • \(name) : \(type)")
        }
        free(ivars)
    } else {
        print("📦 No ivars found")
    }
    print("")

    // MARK: - Instance Methods
    var methodCount: UInt32 = 0
    if let methods = class_copyMethodList(cls, &methodCount) {
        print("⚙️ Instance Methods:")
        for i in 0..<Int(methodCount) {
            let method = methods[i]
            let sel = method_getName(method)
            print("  • \(NSStringFromSelector(sel))")
        }
        free(methods)
    } else {
        print("⚙️ No instance methods found")
    }
    print("")

    // MARK: - Class Methods
    if let metaclass: AnyClass = object_getClass(cls) {
        var classMethodCount: UInt32 = 0
        if let classMethods = class_copyMethodList(metaclass, &classMethodCount) {
            print("⚡️ Class Methods:")
            for i in 0..<Int(classMethodCount) {
                let method = classMethods[i]
                let sel = method_getName(method)
                print("  • \(NSStringFromSelector(sel))")
            }
            free(classMethods)
        } else {
            print("⚡️ No class methods found")
        }
    }
    print("\n✅ Done\n")
}

struct TypeWithSubtype: Hashable {

    enum InputKeyType: String, Hashable {
        case CGColor
        case CGImage
        case NSNumber
        case NSValue
        case NSString
        case luminanceCurveMap
    }

    enum InputKeySubtype: RawRepresentable, Hashable, Equatable {
        
        enum NSNumberSubtype: String, Hashable {
            case angle
            case bool
            case distance
            case float
            case percentage
        }
        
        enum NSValueSubtype: String, Hashable {
            case colorMatrix
            case point
            case rect
        }

        case NSNumber(NSNumberSubtype)
        case NSValue(NSValueSubtype)
        
        init?(rawValue: String) {
            if let nsNumberSubtype = NSNumberSubtype(rawValue: rawValue) {
                self = .NSNumber(nsNumberSubtype)
            } else if let nsValueSubtype = NSValueSubtype(rawValue: rawValue) {
                self = .NSValue(nsValueSubtype)
            } else {
//                print("COULD NOT FIND subtype: \(rawValue) in enum")
                return nil
            }
        }
        
        var rawValue: String {
            switch self {
            case .NSNumber(let subtype):
                subtype.rawValue
            case .NSValue(let subtype):
                subtype.rawValue
            }
        }
    }

    var type: InputKeyType
    var subtype: InputKeySubtype?
    
    init(type: String, subtype: String?) {
        self.type = InputKeyType(rawValue: type)!
        if let subtype {
            self.subtype = InputKeySubtype(rawValue: subtype)
        } else {
            self.subtype = nil
        }
    }
    
    var propertyType: Any.Type {
        switch (type, subtype) {

        case (.CGColor, _):
            return CGColor.self

        case (.CGImage, _):
            return CGImage.self

        case (.NSNumber, .some(.NSNumber(let subtype))):
            switch subtype {
            case .angle, .distance, .float, .percentage:
                return CGFloat.self
            case .bool:
                return Bool.self
            }

        case (.NSNumber, .none):
            return CGFloat.self

        case (.NSValue, .NSValue(let subtype)):
            switch subtype {
            case .colorMatrix:
                return ColorMatrix.self
            case .point:
                return CGPoint.self
            case .rect:
                return CGRect.self
            }

        default:
            return Any.self
        }
    }
}

@Test func enumerateFilterInputKeysSubtypes() {
    let filters = CAFilterType.allCases.compactMap { _CAFilter(type: $0) }
    let subtypes = filters.reduce(into: Set<TypeWithSubtype>(), { partialResult, filter in
        for inputKey in filter.inputKeys() {
            if let attributes = filter.attributes(forKeyPath: inputKey) {
                print(filter, inputKey)
                dump(attributes)
                if let type = attributes["type"] as? String {
                    partialResult.insert(.init(type: type, subtype: attributes["subtype"] as? String))
                }
            }
        }
    })
    dump(subtypes)
}

extension _CAFilter {
    func propertyType(forKey key: String) -> String {
        let attributes = attributes(forKeyPath: key)
        guard let type = attributes?["type"] as? String else {
            return "Any?"
        }
        let subtype = attributes?["subtype"] as? String
        let returnType = TypeWithSubtype(type: type, subtype: subtype).propertyType
        return String(describing: returnType).replacing("Ref", with: "")
    }
}

func filters() -> [(CAFilterType, String, _CAFilter)] {
    return CAFilterType.allCases.compactMap { filterType -> (CAFilterType, String, _CAFilter)? in
        guard let filter = _CAFilter(type: filterType) else {
            return nil
        }
        let protocolName = "CA\(filterType.rawValue.firstUppercased)"
        return (filterType, protocolName, filter)
    }
}

func propertyList(for filter: _CAFilter) -> [(String, String, String?)] {
    return filter.inputKeys().map { inputKey in
        let typeString = filter.propertyType(forKey: inputKey)
        let defaultValue = filter.instance.value(forKey: inputKey) as? String
        return (inputKey, typeString, defaultValue)
    }
}

func enumerateFilterProtocols() throws {
    filters().forEach { _, protocolName, filter in
        filter.setDefaults()
        
        let plist = propertyList(for: filter).map { inputKey, typeString, defaultValue in
            "var \(inputKey): \(typeString)\(defaultValue == nil ? "?" : "") { get set }"
        }
        
        print("""

///
///
///
public protocol \(protocolName): CAFilterProtocol {
    \(plist.joined(separator: "\n    "))
}
""")
    }
}

func enumerateFilterImplementations() {
    filters().forEach { _, protocolName, filter in
        filter.setDefaults()
        
        let plist = propertyList(for: filter).map { inputKey, typeString, defaultValue in
            if let defaultValue {
                "@DynamicLookup public var \(inputKey): \(typeString) = \(defaultValue)"
            } else {
                "@DynamicLookup public var \(inputKey): \(typeString)?"
            }
        }
        
        print("""

extension \(protocolName) where Self: _CAFilter {
    \(plist.joined(separator: "\n    "))
}
""")
    }
}

func enumerateMacroImplementations() {
    let macroList = filters().map { filterType, protocolName, _ in
        "@CAFilter(type: .\(filterType), protocol: \(protocolName).self)"
    }
    
    print("""
\(macroList.joined(separator: "\n"))
extension _CAFilter {}
""")
}

@Test func variableBlur() throws {
    let imageRect = CGRect(origin: .zero, size: .init(width: 100, height: 100))
    let image = CIImage(color: .red).cropped(to: imageRect)
    let cgImage = CIContext().createCGImage(image, from: imageRect)!
    
    let filter = _CAFilter.variableBlur()
    filter.inputMaskImage = cgImage
    filter.inputNormalizeEdges = true
    filter.inputRadius = 10.34
    
    let CAFitler: AnyClass = try #require(NSClassFromString("CAFilter"))
    #expect(filter.instance.isKind(of: CAFitler))
    #expect(filter.inputMaskImage == cgImage)
    #expect(filter.inputNormalizeEdges == true)
    #expect(filter.inputRadius == 10.34)
}

extension String {
    var firstUppercased: String {
        prefix(1).uppercased().appending(dropFirst())
    }

    init(_ unsafePointer: UnsafePointer<CChar>?) {
        if let unsafePointer {
            self = String(cString: unsafePointer)
        } else {
            self = "?"
        }
    }
}
