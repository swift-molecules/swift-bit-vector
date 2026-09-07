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
            url: "https://github.com/swift-atoms/swift-bit.git",
            branch: "main"
        ),
        .package(
            url: "https://github.com/swift-atoms/swift-index.git",
            branch: "main"
        ),
        .package(
            url: "https://github.com/swift-molecules/swift-bit-pack.git",
            branch: "main"
        ),
        .package(
            url: "https://github.com/swift-atoms/swift-property.git",
            branch: "main"
        ),
        .package(
            url: "https://github.com/swift-atoms/swift-ownership.git",
            branch: "main"
        ),
        .package(
            url: "https://github.com/swift-atoms/swift-sequence.git",
            branch: "main"
        ),
        .package(
            url: "https://github.com/swift-atoms/swift-iterator.git",
            branch: "main"
        ),
        .package(
            url: "https://github.com/swift-atoms/swift-affine.git",
            branch: "main"
        ),
        .package(
            url: "https://github.com/swift-atoms/swift-cardinal.git",
            branch: "main"
        ),
        .package(
            url: "https://github.com/swift-atoms/swift-ordinal.git",
            branch: "main"
        ),
        .package(
            url: "https://github.com/swift-atoms/swift-tagged.git",
            branch: "main"
        ),
        .package(
            url: "https://github.com/swift-molecules/swift-cardinal-property.git",
            branch: "main"
        ),
        .package(
            url: "https://github.com/swift-molecules/swift-property-ownership.git",
            branch: "main"
        ),
        .package(
            url: "https://github.com/swift-molecules/swift-tagged-carrier.git",
            branch: "main"
        ),
    ],
    targets: [

        .target(
            name: "Bit Vector Storage",
            dependencies: [
                .product(name: "Bit", package: "swift-bit"),
                .product(name: "Bit Pack", package: "swift-bit-pack"),
                .product(name: "Property", package: "swift-property"),
                .product(name: "Ownership", package: "swift-ownership"),
                .product(name: "Sequence", package: "swift-sequence"),
                .product(name: "Iterator", package: "swift-iterator"),
                .product(name: "Cardinal", package: "swift-cardinal"),
                .product(name: "Index", package: "swift-index"),
                .product(name: "Iterator Protocol", package: "swift-iterator"),
                .product(name: "Iterable", package: "swift-iterator"),
                .product(name: "Ordinal Predecessor", package: "swift-ordinal"),
                .product(name: "Iterator Chunk", package: "swift-iterator"),
                .product(name: "Cardinal Standard Library Integration", package: "swift-cardinal"),
                .product(name: "Ordinal Standard Library Integration", package: "swift-ordinal"),
                .product(name: "Ordinal", package: "swift-ordinal"),
                .product(name: "Ordinal Protocol", package: "swift-ordinal"),
                .product(name: "Tagged", package: "swift-tagged"),
                .product(name: "Affine Tagged", package: "swift-affine"),
                .product(name: "Cardinal Carrier", package: "swift-cardinal"),
                .product(name: "Cardinal Comparison", package: "swift-cardinal"),
                .product(name: "Cardinal Property", package: "swift-cardinal-property"),
                .product(name: "Cardinal Tagged", package: "swift-cardinal"),
                .product(name: "Ordinal Cardinal", package: "swift-ordinal"),
                .product(name: "Ordinal Comparison", package: "swift-ordinal"),
                .product(name: "Ordinal Tagged", package: "swift-ordinal"),
                .product(name: "Property Ownership", package: "swift-property-ownership"),
                .product(name: "Tagged Carrier", package: "swift-tagged-carrier"),
            ]
        ),

        .target(
            name: "Bit Vector Static",
            dependencies: [
                "Bit Vector Storage",
                .product(name: "Bit", package: "swift-bit"),
                .product(name: "Sequence", package: "swift-sequence"),
                .product(name: "Iterator", package: "swift-iterator"),
                .product(name: "Affine", package: "swift-affine"),
                .product(name: "Cardinal", package: "swift-cardinal"),
                .product(name: "Index", package: "swift-index"),
                .product(name: "Iterator Protocol", package: "swift-iterator"),
                .product(name: "Iterable", package: "swift-iterator"),
                .product(name: "Ownership", package: "swift-ownership"),
                .product(name: "Ordinal Predecessor", package: "swift-ordinal"),
                .product(name: "Iterator Chunk", package: "swift-iterator"),
                .product(name: "Cardinal Standard Library Integration", package: "swift-cardinal"),
                .product(name: "Ordinal Standard Library Integration", package: "swift-ordinal"),
                .product(name: "Ordinal", package: "swift-ordinal"),
                .product(name: "Ordinal Protocol", package: "swift-ordinal"),
                .product(name: "Tagged", package: "swift-tagged"),
                .product(name: "Affine Tagged", package: "swift-affine"),
                .product(name: "Cardinal Carrier", package: "swift-cardinal"),
                .product(name: "Cardinal Comparison", package: "swift-cardinal"),
                .product(name: "Cardinal Tagged", package: "swift-cardinal"),
                .product(name: "Ordinal Cardinal", package: "swift-ordinal"),
                .product(name: "Ordinal Comparison", package: "swift-ordinal"),
                .product(name: "Ordinal Tagged", package: "swift-ordinal"),
                .product(name: "Tagged Carrier", package: "swift-tagged-carrier"),
            ]
        ),
        .target(
            name: "Bit Vector Bounded",
            dependencies: [
                "Bit Vector Storage",
                .product(name: "Property", package: "swift-property"),
                .product(name: "Sequence", package: "swift-sequence"),
                .product(name: "Iterator", package: "swift-iterator"),
                .product(name: "Affine", package: "swift-affine"),
                .product(name: "Cardinal", package: "swift-cardinal"),
                .product(name: "Index", package: "swift-index"),
                .product(name: "Iterator Protocol", package: "swift-iterator"),
                .product(name: "Iterable", package: "swift-iterator"),
                .product(name: "Ownership", package: "swift-ownership"),
                .product(name: "Ordinal Predecessor", package: "swift-ordinal"),
                .product(name: "Iterator Chunk", package: "swift-iterator"),
                .product(name: "Cardinal Standard Library Integration", package: "swift-cardinal"),
                .product(name: "Ordinal Standard Library Integration", package: "swift-ordinal"),
                .product(name: "Ordinal", package: "swift-ordinal"),
                .product(name: "Ordinal Protocol", package: "swift-ordinal"),
                .product(name: "Tagged", package: "swift-tagged"),
                .product(name: "Affine Tagged", package: "swift-affine"),
                .product(name: "Cardinal Carrier", package: "swift-cardinal"),
                .product(name: "Cardinal Comparison", package: "swift-cardinal"),
                .product(name: "Cardinal Hash", package: "swift-cardinal"),
                .product(name: "Cardinal Property", package: "swift-cardinal-property"),
                .product(name: "Cardinal Tagged", package: "swift-cardinal"),
                .product(name: "Ordinal Cardinal", package: "swift-ordinal"),
                .product(name: "Ordinal Comparison", package: "swift-ordinal"),
                .product(name: "Ordinal Tagged", package: "swift-ordinal"),
                .product(name: "Property Ownership", package: "swift-property-ownership"),
                .product(name: "Tagged Carrier", package: "swift-tagged-carrier"),
            ]
        ),
        .target(
            name: "Bit Vector Inline",
            dependencies: [
                "Bit Vector Storage",
                .product(name: "Property", package: "swift-property"),
                .product(name: "Ownership", package: "swift-ownership"),
                .product(name: "Sequence", package: "swift-sequence"),
                .product(name: "Iterator", package: "swift-iterator"),
                .product(name: "Affine", package: "swift-affine"),
                .product(name: "Cardinal", package: "swift-cardinal"),
                .product(name: "Index", package: "swift-index"),
                .product(name: "Iterator Protocol", package: "swift-iterator"),
                .product(name: "Iterable", package: "swift-iterator"),
                .product(name: "Ordinal Predecessor", package: "swift-ordinal"),
                .product(name: "Iterator Chunk", package: "swift-iterator"),
                .product(name: "Cardinal Standard Library Integration", package: "swift-cardinal"),
                .product(name: "Ordinal Standard Library Integration", package: "swift-ordinal"),
                .product(name: "Ordinal", package: "swift-ordinal"),
                .product(name: "Ordinal Protocol", package: "swift-ordinal"),
                .product(name: "Tagged", package: "swift-tagged"),
                .product(name: "Affine Tagged", package: "swift-affine"),
                .product(name: "Cardinal Carrier", package: "swift-cardinal"),
                .product(name: "Cardinal Comparison", package: "swift-cardinal"),
                .product(name: "Cardinal Hash", package: "swift-cardinal"),
                .product(name: "Cardinal Property", package: "swift-cardinal-property"),
                .product(name: "Cardinal Tagged", package: "swift-cardinal"),
                .product(name: "Ordinal Cardinal", package: "swift-ordinal"),
                .product(name: "Ordinal Comparison", package: "swift-ordinal"),
                .product(name: "Ordinal Tagged", package: "swift-ordinal"),
                .product(name: "Property Ownership", package: "swift-property-ownership"),
                .product(name: "Tagged Carrier", package: "swift-tagged-carrier"),
            ]
        ),
        .target(
            name: "Bit Vector Dynamic",
            dependencies: [
                "Bit Vector Storage",
                "Bit Vector Bounded",
                "Bit Vector Inline",
                .product(name: "Property", package: "swift-property"),
                .product(name: "Ownership", package: "swift-ownership"),
                .product(name: "Iterator", package: "swift-iterator"),
                .product(name: "Affine", package: "swift-affine"),
                .product(name: "Cardinal", package: "swift-cardinal"),
                .product(name: "Index", package: "swift-index"),
                .product(name: "Iterator Protocol", package: "swift-iterator"),
                .product(name: "Iterable", package: "swift-iterator"),
                .product(name: "Ordinal Predecessor", package: "swift-ordinal"),
                .product(name: "Iterator Chunk", package: "swift-iterator"),
                .product(name: "Cardinal Standard Library Integration", package: "swift-cardinal"),
                .product(name: "Ordinal Standard Library Integration", package: "swift-ordinal"),
                .product(name: "Ordinal", package: "swift-ordinal"),
                .product(name: "Ordinal Protocol", package: "swift-ordinal"),
                .product(name: "Tagged", package: "swift-tagged"),
                .product(name: "Affine Tagged", package: "swift-affine"),
                .product(name: "Affine Carrier", package: "swift-affine"),
                .product(name: "Cardinal Carrier", package: "swift-cardinal"),
                .product(name: "Cardinal Comparison", package: "swift-cardinal"),
                .product(name: "Cardinal Hash", package: "swift-cardinal"),
                .product(name: "Cardinal Property", package: "swift-cardinal-property"),
                .product(name: "Cardinal Tagged", package: "swift-cardinal"),
                .product(name: "Ordinal Cardinal", package: "swift-ordinal"),
                .product(name: "Ordinal Comparison", package: "swift-ordinal"),
                .product(name: "Ordinal Tagged", package: "swift-ordinal"),
                .product(name: "Property Ownership", package: "swift-property-ownership"),
                .product(name: "Tagged Carrier", package: "swift-tagged-carrier"),
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
                    name: "Cardinal Standard Library Integration",
                    package: "swift-cardinal"
                ),
                .product(
                    name: "Ordinal Standard Library Integration",
                    package: "swift-ordinal"
                ),
                .product(
                    name: "Tagged Standard Library Integration",
                    package: "swift-tagged"
                ),
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
                .product(name: "Index", package: "swift-index"),
                .product(name: "Iterator Protocol", package: "swift-iterator"),
                .product(name: "Iterable", package: "swift-iterator"),
                .product(name: "Ownership", package: "swift-ownership"),
                .product(name: "Ordinal Predecessor", package: "swift-ordinal"),
                .product(name: "Iterator Chunk", package: "swift-iterator"),
                .product(name: "Cardinal Standard Library Integration", package: "swift-cardinal"),
                .product(name: "Ordinal Standard Library Integration", package: "swift-ordinal"),
                .product(name: "Ordinal", package: "swift-ordinal"),
                .product(name: "Ordinal Protocol", package: "swift-ordinal"),
                .product(name: "Tagged", package: "swift-tagged"),
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
