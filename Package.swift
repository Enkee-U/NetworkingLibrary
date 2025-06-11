// swift-tools-version: 6.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

// swift-tools-version: 6.0
import PackageDescription

let package = Package(
    name: "NetworkingLibrary",
    products: [
        .library(
            name: "NetworkingLibrary",
            targets: ["NetworkingLibrary"]),
    ],
    targets: [
        .target(
            name: "NetworkingLibrary",
            path: "Sources",
            sources: ["NetworkingLibrary", "Services"] // 👈 Include both folders
        ),
        .testTarget(
            name: "NetworkingLibraryTests",
            dependencies: ["NetworkingLibrary"]
        ),
    ]
)
