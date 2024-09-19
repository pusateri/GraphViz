// swift-tools-version:5.2
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "GraphViz",
    platforms: [
        .macOS(.v10_15), .iOS(.v13)
    ],
    products: [
        // Products define the executables and libraries produced by a package, and make them visible to other packages.
        .library(
            name: "GraphViz",
            targets: ["GraphViz"]),
    ],
    dependencies: [
        .package(url: "https://github.com/pusateri/GraphvizFrameworkPkg", from: "0.2.1")
    ],
    targets: [
        .target(
            name: "GraphViz",
            dependencies: []),
        .testTarget(
            name: "GraphVizTests",
            dependencies: ["GraphViz"]),
    ]
)
