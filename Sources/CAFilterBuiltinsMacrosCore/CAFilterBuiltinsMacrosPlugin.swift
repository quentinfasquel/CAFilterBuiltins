//
//  CAFilterMacrosPlugin.swift
//  CAFilterBuiltins
//
//  Created by Quentin Fasquel on 02/09/2025.
//

import SwiftCompilerPlugin
import SwiftSyntaxMacros

@main
struct CAFilterBuiltinsMacrosPlugin: CompilerPlugin {
    let providingMacros: [Macro.Type] = [
        CAFilterMacro.self,
        DynamicLookupMacro.self,
    ]
}
