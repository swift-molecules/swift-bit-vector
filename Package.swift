// swift-tools-version: 6.4

import PackageDescription

let package = Package(
    name: "swift-bit-vector",
    platforms: [
        .macOS(.v27),
        .iOS(.v27),
        .tvOS(.v27),
        .watchOS(.v27),
        .visionOS(.v27),
    ],
    products: [

        .library(
            name: "Bit Vector Storage",
            targets: ["Bit Vector Storage"]
        ),

        .library(
            name: "Bit Vector Static",
            targets: ["Bit Vector Static"]
        ),
        .library(
            name: "Bit Vector Bounded",
            targets: ["Bit Vector Bounded"]
        ),
        .library(
            name: "Bit Vector Inline",
            targets: ["Bit Vector Inline"]
        ),
        .library(
            name: "Bit Vector Dynamic",
            targets: ["Bit Vector Dynamic"]
        ),

        .library(
            name: "Bit Vector",
            targets: ["Bit Vector"]
        ),

        .library(
            name: "Bit Vector Test Support",
            targets: ["Bit Vector Test Support"]
        ),
    ],
    dependencies: [
        .package(
            url: "https://github.com/swift-molecules/swift-bit.git",
            branch: "main"
        ),
        .package(
            url: "https://github.com/swift-molecules/swift-bit-pack.git",
            branch: "main"
        ),
        .package(
            url: "https://github.com/swift-molecules/swift-index.git",
            branch: "main"
        ),
        .package(
            url: "https://github.com/swift-molecules/swift-property.git",
            branch: "main"
        ),
        .package(
            url: "https://github.com/swift-molecules/swift-sequence.git",
            branch: "main"
        ),
        .package(
            url: "https://github.com/swift-molecules/swift-iterator.git",
            branch: "main"
        ),
        .package(
            url: "https://github.com/swift-molecules/swift-affine.git",
            branch: "main"
        ),
    ],
    targets: [

        .target(
            name: "Bit Vector Storage",
            dependencies: [
                .product(name: "Bit", package: "swift-bit"),
                .product(name: "Bit Pack", package: "swift-bit-pack"),
                .product(name: "Index", package: "swift-index"),
                .product(name: "Property", package: "swift-property"),
                .product(name: "Sequence", package: "swift-sequence"),
                .product(name: "Iterable", package: "swift-iterator"),
                .product(name: "Iterator Primitive", package: "swift-iterator"),
                .product(name: "Iterator Chunk", package: "swift-iterator"),
            ]
        ),

        .target(
            name: "Bit Vector Static",
            dependencies: [
                "Bit Vector Storage",
                .product(name: "Bit", package: "swift-bit"),
                .product(name: "Sequence", package: "swift-sequence"),
                .product(name: "Iterator Primitive", package: "swift-iterator"),
                .product(name: "Iterator Chunk", package: "swift-iterator"),
                .product(name: "Affine", package: "swift-affine"),
            ]
        ),
        .target(
            name: "Bit Vector Bounded",
            dependencies: [
                "Bit Vector Storage",
                .product(name: "Index", package: "swift-index"),
                .product(name: "Property", package: "swift-property"),
                .product(name: "Sequence", package: "swift-sequence"),
                .product(name: "Iterator Primitive", package: "swift-iterator"),
                .product(name: "Iterator Chunk", package: "swift-iterator"),
                .product(name: "Affine", package: "swift-affine"),
            ]
        ),
        .target(
            name: "Bit Vector Inline",
            dependencies: [
                "Bit Vector Storage",
                .product(name: "Index", package: "swift-index"),
                .product(name: "Property", package: "swift-property"),
                .product(name: "Sequence", package: "swift-sequence"),
                .product(name: "Iterator Primitive", package: "swift-iterator"),
                .product(name: "Iterator Chunk", package: "swift-iterator"),
                .product(name: "Affine", package: "swift-affine"),
            ]
        ),
        .target(
            name: "Bit Vector Dynamic",
            dependencies: [
                "Bit Vector Storage",
                "Bit Vector Bounded",
                "Bit Vector Inline",
                .product(name: "Property", package: "swift-property"),
                .product(name: "Affine", package: "swift-affine"),
            ]
        ),

        .target(
            name: "Bit Vector",
            dependencies: [
                "Bit Vector Storage",
                "Bit Vector Static",
                "Bit Vector Bounded",
                "Bit Vector Inline",
                "Bit Vector Dynamic",
            ]
        ),

        .target(
            name: "Bit Vector Test Support",
            dependencies: [
                "Bit Vector",
                .product(
                    name: "Bit Pack Test Support",
                    package: "swift-bit-pack"
                ),
            ],
            path: "Tests/Support"
        ),
        .testTarget(
            name: "Bit Vector Tests",
            dependencies: [
                "Bit Vector",
                "Bit Vector Test Support",
            ]
        ),
    ],
    swiftLanguageModes: [.v6]
)

for target in package.targets where ![.system, .binary, .plugin, .macro].contains(target.type) {
    let ecosystem: [SwiftSetting] = [
        .strictMemorySafety(),
        .enableUpcomingFeature("ExistentialAny"),
        .enableUpcomingFeature("InternalImportsByDefault"),
        .enableUpcomingFeature("MemberImportVisibility"),
        .enableUpcomingFeature("NonisolatedNonsendingByDefault"),
        .enableExperimentalFeature("Lifetimes"),
        .enableUpcomingFeature("InferIsolatedConformances"),
    ]

    let package: [SwiftSetting] = []

    target.swiftSettings = (target.swiftSettings ?? []) + ecosystem + package
}
