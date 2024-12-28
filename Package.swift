// swift-tools-version: 6.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "BLog",
    platforms: [
        .iOS(.v15), .macOS(.v14)
    ],
    products: [
        .library(
            name: "BLog",
            targets: ["BLog"]),
    ],
    targets: [
        .target(
            name: "BLog"),
        .testTarget(
            name: "BLogTests",
            dependencies: ["BLog"]
        ),
    ]
)
