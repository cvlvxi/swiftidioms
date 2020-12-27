// swift-tools-version:5.2
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "clitool",
    products: [
        .library(name: "somelib", targets: ["somelib"]),
        .executable(name: "clitool", targets: ["clitool"])
    ],
    dependencies: [
        .package(url: "https://github.com/apple/swift-argument-parser", from: "0.3.0"),
    ],
    targets: [
        .target(
            name: "somelib",
            path: "Sources/somelib"
        ),
        .target(
            name: "clitool",
            dependencies: [
                "somelib",
                .product(name: "ArgumentParser", package: "swift-argument-parser")
                ],
            path: "Sources/clitool"),
        
        .testTarget(name: "somelibTests", dependencies: ["somelib"])
    ]
    
)
