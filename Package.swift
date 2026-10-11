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
        .package(url: "https://github.com/swift-atoms/swift-addition.git", branch: "main"),
        .package(url: "https://github.com/swift-atoms/swift-carrier.git", branch: "main"),
        .package(url: "https://github.com/swift-atoms/swift-subtraction.git", branch: "main"),
        .package(
            url: "https://github.com/swift-atoms/swift-bit.git",
            branch: "main"
        ),
        .package(
            url: "https://github.com/swift-atoms/swift-index.git",
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
            url: "https://github.com/swift-atoms/swift-difference.git",
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
        .package(url: "https://github.com/swift-atoms/swift-ratio.git", branch: "main", traits: ["Bit", "Ordinal"]),
    ],
    targets: [

        .target(
            name: "Bit Vector Storage",
            dependencies: [
                .product(name: "Addition", package: "swift-addition"),
                .product(name: "Carrier", package: "swift-carrier"),
                .product(name: "Subtraction", package: "swift-subtraction"),

                .product(name: "Bit", package: "swift-bit"),
                .product(name: "Property", package: "swift-property"),
                .product(name: "Ownership", package: "swift-ownership"),
                .product(name: "Sequence", package: "swift-sequence"),
                .product(name: "Iterator", package: "swift-iterator"),
                .product(name: "Cardinal", package: "swift-cardinal"),
                .product(name: "Index", package: "swift-index"),
                .product(name: "Ordinal", package: "swift-ordinal"),
                .product(name: "Tagged", package: "swift-tagged"),
                .product(name: "Difference", package: "swift-difference"),
                .product(name: "Ratio", package: "swift-ratio"),
            ]
        ),

        .target(
            name: "Bit Vector Static",
            dependencies: [
                .product(name: "Carrier", package: "swift-carrier"),

                .target(name: "Bit Vector Storage"),
                .product(name: "Bit", package: "swift-bit"),
                .product(name: "Sequence", package: "swift-sequence"),
                .product(name: "Iterator", package: "swift-iterator"),
                .product(name: "Difference", package: "swift-difference"),
                .product(name: "Cardinal", package: "swift-cardinal"),
                .product(name: "Index", package: "swift-index"),
                .product(name: "Ownership", package: "swift-ownership"),
                .product(name: "Ordinal", package: "swift-ordinal"),
                .product(name: "Tagged", package: "swift-tagged"),
                .product(name: "Property", package: "swift-property"),
            ]
        ),
        .target(
            name: "Bit Vector Bounded",
            dependencies: [
                .product(name: "Carrier", package: "swift-carrier"),

                .target(name: "Bit Vector Storage"),
                .product(name: "Property", package: "swift-property"),
                .product(name: "Sequence", package: "swift-sequence"),
                .product(name: "Iterator", package: "swift-iterator"),
                .product(name: "Difference", package: "swift-difference"),
                .product(name: "Cardinal", package: "swift-cardinal"),
                .product(name: "Index", package: "swift-index"),
                .product(name: "Ownership", package: "swift-ownership"),
                .product(name: "Ordinal", package: "swift-ordinal"),
                .product(name: "Tagged", package: "swift-tagged"),
            ]
        ),
        .target(
            name: "Bit Vector Inline",
            dependencies: [
                .product(name: "Carrier", package: "swift-carrier"),

                .target(name: "Bit Vector Storage"),
                .product(name: "Property", package: "swift-property"),
                .product(name: "Ownership", package: "swift-ownership"),
                .product(name: "Sequence", package: "swift-sequence"),
                .product(name: "Iterator", package: "swift-iterator"),
                .product(name: "Difference", package: "swift-difference"),
                .product(name: "Cardinal", package: "swift-cardinal"),
                .product(name: "Index", package: "swift-index"),
                .product(name: "Ordinal", package: "swift-ordinal"),
                .product(name: "Tagged", package: "swift-tagged"),
            ]
        ),
        .target(
            name: "Bit Vector Dynamic",
            dependencies: [
                .product(name: "Carrier", package: "swift-carrier"),

                .target(name: "Bit Vector Storage"),
                .target(name: "Bit Vector Bounded"),
                .target(name: "Bit Vector Inline"),
                .product(name: "Property", package: "swift-property"),
                .product(name: "Ownership", package: "swift-ownership"),
                .product(name: "Iterator", package: "swift-iterator"),
                .product(name: "Difference", package: "swift-difference"),
                .product(name: "Cardinal", package: "swift-cardinal"),
                .product(name: "Index", package: "swift-index"),
                .product(name: "Ordinal", package: "swift-ordinal"),
                .product(name: "Tagged", package: "swift-tagged"),
            ]
        ),

        .target(
            name: "Bit Vector",
            dependencies: [
                .target(name: "Bit Vector Storage"),
                .target(name: "Bit Vector Static"),
                .target(name: "Bit Vector Bounded"),
                .target(name: "Bit Vector Inline"),
                .target(name: "Bit Vector Dynamic"),
            ]
        ),

        .target(
            name: "Bit Vector Test Support",
            dependencies: [
                .target(name: "Bit Vector"),
                .product(
                    name: "Cardinal",
                    package: "swift-cardinal"
                ),
                .product(
                    name: "Ordinal",
                    package: "swift-ordinal"
                ),
                .product(
                    name: "Tagged",
                    package: "swift-tagged"
                ),
                .product(name: "Ratio Test Support", package: "swift-ratio"),
            ],
            path: "Tests/Support"
        ),
        .testTarget(
            name: "Bit Vector Tests",
            dependencies: [
                .target(name: "Bit Vector"),
                .target(name: "Bit Vector Test Support"),
                .product(name: "Index", package: "swift-index"),
                .product(name: "Iterator", package: "swift-iterator"),
                .product(name: "Ownership", package: "swift-ownership"),
                .product(name: "Cardinal", package: "swift-cardinal"),
                .product(name: "Ordinal", package: "swift-ordinal"),
                .product(name: "Tagged", package: "swift-tagged"),
            ]
        ),
    ],
    swiftLanguageModes: [.v6]
)

for target in package.targets where ![.system, .binary, .plugin, .macro].contains(target.type) {
    target.swiftSettings = (target.swiftSettings ?? []) + [
        .strictMemorySafety(),
        .enableUpcomingFeature("ExistentialAny"),
        .enableUpcomingFeature("InternalImportsByDefault"),
        .enableUpcomingFeature("MemberImportVisibility"),
        .enableUpcomingFeature("NonisolatedNonsendingByDefault"),
        .enableUpcomingFeature("InferIsolatedConformances"),
        .enableExperimentalFeature("Lifetimes"),
        .treatAllWarnings(as: .error),
    ]
}
