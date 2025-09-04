import Foundation
import SwiftSyntax
import SwiftSyntaxBuilder
import SwiftSyntaxMacros

public struct DynamicLookupMacro: AccessorMacro {
    public static func expansion(
        of node: SwiftSyntax.AttributeSyntax,
        providingAccessorsOf declaration: some SwiftSyntax.DeclSyntaxProtocol,
        in context: some SwiftSyntaxMacros.MacroExpansionContext
    ) throws -> [SwiftSyntax.AccessorDeclSyntax] {

        guard let variableDecl = declaration.as(VariableDeclSyntax.self),
              let binding = variableDecl.bindings.first,
              let varId = binding.pattern.as(IdentifierPatternSyntax.self),
              let _ = binding.typeAnnotation else {
            throw CustomError("DynamicLookup macro requires the property to have an explicit type annotation.")
        }

        let propertyName = varId.identifier.text
//        let propertyType = typeAnnotation.type.description.trimmingCharacters(in: .whitespacesAndNewlines)

        let getter = AccessorDeclSyntax(
            "get { value(forKey: \"\(raw: propertyName)\") }"
        )

        let setter = AccessorDeclSyntax(
            "set { self.setValue(newValue, forKey: \"\(raw: propertyName)\") }"
        )

        return [getter, setter]
    }
}

struct CustomError: Error, CustomStringConvertible {
    var description: String
    init(_ desc: String) { self.description = desc }
}


