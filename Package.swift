// swift-tools-version:5.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "TimeKit",
    products: [
        .library(
            name: "TimeKit",
            targets: ["TimeKit"]),
    ],
    targets: [
        .target(
            name: "TimeKit",
            dependencies: []),
        .testTarget(
            name: "TimeKitTests",
            dependencies: ["TimeKit"]),
    ]
)
