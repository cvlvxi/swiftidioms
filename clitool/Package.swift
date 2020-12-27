// swift-tools-version:5.2
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

//let package = Package(
//    name: "clitool",
//    products: [
//        .executable(name: "clitool", targets: ["clitool"]),
//        .library(name: "somelib", targets: ["somelib"])
//
//    ],
//    dependencies: [
//        // Dependencies declare other packages that this package depends on.
//        // .package(url: /* package url */, from: "1.0.0"),
//        .package(url: "https://github.com/apple/swift-argument-parser", from: "0.3.0"),
//    ],
//    targets: [
//        .target(name: "somelib", path: "Sources/somelib"),
//        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
//        // Targets can depend on other targets in this package, and on products in packages which this package depends on.
////        .ta
////        .target(
////            name: "clitool",
////            dependencies: [
////                .product(name: "ArgumentParser", package: "swift-argument-parser"),
////                "somelib",
////            ],
////            path: "Sources/clitool"
////        ),
////        .testTarget(
////            name: "clitoolTests",
////            dependencies: ["clitool"]),
//    ]
//)

let package = Package(
    name: "clitool",
    products: [
        .library(name: "somelib", targets: ["somelib"]),
        .executable(name: "dog", targets: ["dog"])
    ],
    targets: [
        .target(name: "somelib", path: "Sources/somelib"),
        .target(name: "dog", dependencies: ["somelib"], path: "Sources/dog"),
        .testTarget(name: "somelibTests", dependencies: ["somelib"])
    ]
    
)
