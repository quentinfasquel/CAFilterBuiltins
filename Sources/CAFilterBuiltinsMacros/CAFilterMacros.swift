//
//  CAFilterMacros.swift
//  CAFilterBuiltinsMacros
//
//  Created by Quentin Fasquel on 01/09/2025.
//

import CAFilter

@attached(member, names: arbitrary)
public macro CAFilter(type: CAFilterType, protocol: Any.Type) = #externalMacro(
    module: "CAFilterBuiltinsMacrosCore",
    type: "CAFilterMacro"
)

@attached(accessor)
public macro DynamicLookup() = #externalMacro(
    module: "CAFilterBuiltinsMacrosCore",
    type: "DynamicLookupMacro"
)
