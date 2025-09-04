//
//  CAFilterClassMacro.swift
//  OpenUI
//
//  Created by Quentin Fasquel on 01/09/2025.
//

import Foundation
import SwiftSyntax
import SwiftSyntaxMacros

public struct CAFilterMacro: MemberMacro {

    // MARK: Member Macro

    public static func expansion(
        of node: AttributeSyntax,
        providingMembersOf declaration: some DeclGroupSyntax,
        conformingTo protocols: [TypeSyntax],
        in context: some MacroExpansionContext
    ) throws -> [DeclSyntax] {
        // Ensure the attribute is attached to `extension _CAFilter { ... }`
        guard isExtensionOfCAFilter(declaration) else {
            throw MacroError.onlyOnCAFilterExtension
        }

        let args = try ParsedArgs.parse(from: node)
        let factoryName = args.caseName // e.g. "variableBlur"
        let protoName = args.protocolTypeName // e.g. "CAVariableBlur"
        let concreteName = "\(args.caseName.capitalizingFirst)"
        let typeExpr = args.typeExpr
        
        let member: DeclSyntax = """
            final class \(raw: concreteName): _CAFilter, \(raw: protoName) {
              convenience init() {
                self.init(type: \(typeExpr))!
              }
            }
            public static func \(raw: factoryName)() -> _CAFilter & \(raw: protoName) {
              \(raw: concreteName)()
            //  self.init(type: \"\(typeExpr)\") as! _CAFilter & \(raw: protoName) 
            }
            """
        return [member]
    }

    // MARK: Helpers

    private static func isExtensionOfCAFilter(_ declaration: some SyntaxProtocol) -> Bool {
        guard let ext = declaration.as(ExtensionDeclSyntax.self) else { return false }
        return isCAFilterType(ext.extendedType)
    }

    private static func isCAFilterType(_ type: TypeSyntax) -> Bool {
        // Accept `_CAFilter`
        if let ident = type.as(IdentifierTypeSyntax.self) {
            return ident.name.text == "_CAFilter"
        }
        // Accept qualified names like `Module._CAFilter`
        if let member = type.as(MemberTypeSyntax.self) {
            // Walk to the rightmost base name
            var current: MemberTypeSyntax? = member
            while let nextBase = current?.baseType.as(MemberTypeSyntax.self) {
                current = nextBase
            }
            if let name = current?.name.text ?? member.name.text as String? {
                return name == "_CAFilter"
            }
        }
        return false
    }
}

enum MacroError: Error, CustomStringConvertible {
    case missingArgs
    case missingType
    case missingProtocol
    case onlyOnCAFilterExtension
    var description: String {
        switch self {
        case .missingArgs: "Missing arguments. Use `@CAFilter(type: ..., protocol: ...)`."
        case .missingType: "Missing `type:` argument."
        case .missingProtocol: "Missing `protocol:` argument."
        case .onlyOnCAFilterExtension: "@CAFilter can only be applied to `extension _CAFilter { ... }`."
        }
    }
}

struct ParsedArgs {
    let typeExpr: ExprSyntax       // e.g. `.variableBlur`
    let caseName: String           // e.g. "variableBlur"
    let protocolTypeName: String   // e.g. "CAVariableBlur"

    static func parse(from attr: AttributeSyntax) throws -> ParsedArgs {
        guard let list = attr.arguments?.as(LabeledExprListSyntax.self) else { throw MacroError.missingArgs }

        // type: .variableBlur
        guard let typeArg = list.first(where: { $0.label?.text == "type" || $0.label == nil })
        else { throw MacroError.missingType }
        let typeExpr = ExprSyntax(typeArg.expression)
        let caseName = try extractCaseName(from: typeExpr) ?? { throw MacroError.missingType }()

        // protocol: CAVariableBlur.self
        guard let protoArg = list.first(where: { $0.label?.text == "protocol" })
        else { throw MacroError.missingProtocol }
        let protoName = try extractTypeName(from: protoArg.expression) ?? { throw MacroError.missingProtocol }()

        return ParsedArgs(typeExpr: typeExpr, caseName: caseName, protocolTypeName: protoName)
    }

    private static func extractCaseName(from expr: ExprSyntax) -> String? {
        if let m = expr.as(MemberAccessExprSyntax.self) { return m.declName.baseName.text }
        let tokens = Array(expr.tokens(viewMode: .fixedUp))
        return tokens.reversed().first(where: { $0.tokenKind.isIdentifierLike })?.text
    }

    private static func extractTypeName(from expr: ExprSyntax) -> String? {
        // Expect something like `CAVariableBlur.self`
        let text = expr.trimmedDescription
        if let dot = text.firstIndex(of: "."), text.hasSuffix(".self") {
            return String(text[..<dot])
        }
        // Fallback: use last identifier token sequence
        let idents = expr.tokens(viewMode: .fixedUp).filter { $0.tokenKind.isIdentifierLike }.map(\.text)
        return idents.last
    }
}

fileprivate extension String {
    var capitalizingFirst: String { prefix(1).uppercased() + dropFirst() }
}

fileprivate extension TokenKind {
    var isIdentifierLike: Bool {
        switch self {
        case .identifier, .keyword: true
        default: false
        }
    }
}
