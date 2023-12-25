// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "SketchClinicForms",
    platforms: [
        .iOS(.v16),
        .macOS(.v13),
    ],
    products: [
        // Products define the executables and libraries a package produces, making them visible to other packages.
        .library(
            name: "SketchClinicForms",
            targets: ["SketchClinicForms"])
    ],
    dependencies: [
        .package(url: "https://github.com/gonzalezreal/swift-markdown-ui", from: "2.0.2"),
//        .package(url: "https://github.com/hussc/sketchclinicfoundation", branch: "main"),
        .package(path: "../sketchclinic-foundation")
    ],
    targets: [
        // Targets are the basic building blocks of a package, defining a module or a test suite.
        // Targets can depend on other targets in this package and products from dependencies.
        .target(
            name: "SketchClinicForms", dependencies: [
                .product(name: "MarkdownUI", package: "swift-markdown-ui"),
                .product(name: "SketchClinicFoundation", package: "sketchclinic-foundation")
            ]),
        .testTarget(
            name: "SketchClinicFormsTests",
            dependencies: ["SketchClinicForms"]),
    ]
)
