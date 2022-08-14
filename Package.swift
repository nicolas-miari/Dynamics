// swift-tools-version: 5.7
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Dynamics",
    platforms: [
      .iOS(.v15),
      .macOS(.v11)
    ],
    products: [
        // Products define the executables and libraries a package produces, and make them visible to other packages.
        .library(
            name: "Dynamics",
            targets: ["Dynamics"]),
    ],
    dependencies: [
      .package(url: "https://github.com/nicolas-miari/Component.git", from: "1.0.0"),
      .package(url: "https://github.com/nicolas-miari/Entity.git", from: "1.0.0"),
      .package(url: "https://github.com/nicolas-miari/RigidBody.git", from: "1.0.0"),
      .package(url: "https://github.com/nicolas-miari/System.git", from: "1.0.0"),
      .package(url: "https://github.com/nicolas-miari/Transform.git", from: "1.0.0"),
    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages this package depends on.
        .target(
            name: "Dynamics",
            dependencies: [
              .product(name: "Component", package: "Component"),
              .product(name: "Entity", package: "Entity"),
              .product(name: "RigidBody", package: "RigidBody"),
              .product(name: "System", package: "System"),
              .product(name: "Transform", package: "Transform"),
            ]),
        .testTarget(
            name: "DynamicsTests",
            dependencies: ["Dynamics"]),
    ]
)
