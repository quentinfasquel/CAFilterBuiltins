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
              let typeAnnotation = binding.typeAnnotation else {
            throw CustomError("DynamicLookup macro requires the property to have an explicit type annotation.")
        }

        let propertyName = varId.identifier.text
        let propertyType = typeAnnotation.type.description.trimmingCharacters(in: .whitespacesAndNewlines)

        // Prefer the property's initializer as default value if present: `var foo: T = <expr>`
        let initializerExpr = binding.initializer?.value

        // Determine fallback expression for getter
        let fallbackExpr: String
        if let initializerExpr {
            fallbackExpr = initializerExpr.description
        } else if propertyType.hasSuffix("?") {
            fallbackExpr = "nil"
        } else {
            throw CustomError("DynamicLookup requires either an initializer (e.g. '= …') or an optional type for '\(propertyName)'.")
        }

        let getter = AccessorDeclSyntax(
            "get { self[dynamicMember: \"\(raw: propertyName)\"] ?? \(raw: fallbackExpr) }"
        )
        let setter = AccessorDeclSyntax(
            "set { self[dynamicMember: \"\(raw: propertyName)\"] = newValue }"
        )
        return [getter, setter]
    }
}

struct CustomError: Error, CustomStringConvertible {
    var description: String
    init(_ desc: String) { self.description = desc }
}


