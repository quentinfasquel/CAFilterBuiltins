// swift-tools-version: 6.1
// The swift-tools-version declares the minimum version of Swift required to build this package.

import CompilerPluginSupport
import PackageDescription

let package = Package(
    name: "CAFilterBuiltins",
    platforms: [
        .iOS(.v17),
        .macOS(.v14),
    ],
    products: [
        .library(
            name: "CAFilterBuiltins",
            targets: ["CAFilterBuiltins"]
        ),
    ],
    dependencies: [
        .package(url: "https://github.com/swiftlang/swift-syntax.git", from: "601.0.0-latest"),
    ],
    targets: [
        .target(
            name: "CAFilterProxy",
            publicHeadersPath: "."
        ),
        .target(
            name: "CAFilter",
            dependencies: [
                "CAFilterProxy"
            ],
        ),
        .target(
            name: "CAFilterBuiltins",
            dependencies: [
                "CAFilter",
                "CAFilterBuiltinsMacros"
            ],
        ),
        .target(
            name: "CAFilterBuiltinsMacros",
            dependencies: [
                "CAFilter",
                "CAFilterBuiltinsMacrosCore"
            ]
        ),
        .macro(
            name: "CAFilterBuiltinsMacrosCore",
            dependencies: [
                .product(name: "SwiftCompilerPlugin", package: "swift-syntax"),
                .product(name: "SwiftSyntaxMacros", package: "swift-syntax"),
            ]
        ),
        .testTarget(
            name: "CAFilterBuiltinsTests",
            dependencies: [
                "CAFilterBuiltins",
                "CAFilterBuiltinsMacros",
            ]
        ),
    ]
)
