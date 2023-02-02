// swift-tools-version:5.7

import PackageDescription

let package = Package(
    name: "Ed25519",
    platforms: [
        .macOS(.v11),
        .iOS(.v13),
        .tvOS(.v13),
        .watchOS(.v9),
        .driverKit(.v22),
        .macCatalyst(.v13)
    ],
    products: [
        .library(name: "Ed25519", targets: ["Ed25519"]),
        .library(name: "CEd25519", targets: ["CEd25519"])
    ],
    targets: [
        .target(name: "Ed25519", dependencies: ["CEd25519"]),
        .target(name: "CEd25519", dependencies: []),
        .testTarget(name: "Ed25519Tests", dependencies: ["Ed25519"])
    ]
)
