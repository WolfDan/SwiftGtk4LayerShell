// swift-tools-version: 6.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Gtk4LayerShell",
    products: [
        // Products define the executables and libraries a package produces, making them visible to other packages.
        .library(
            name: "Gtk4LayerShell",
            targets: ["Gtk4LayerShell"])
    ],
    dependencies: [
        .package(url: "https://github.com/WolfDan/swift-cross-ui", branch: "scene-integration")
    ],
    targets: [
        // Targets are the basic building blocks of a package, defining a module or a test suite.
        // Targets can depend on other targets in this package and products from dependencies.
        .systemLibrary(
            name: "CGtk4LayerShell", pkgConfig: "gtk4-layer-shell-0",
            providers: [
                .apt([
                    "libgtk-4-dev", "libwayland-dev", "wayland-protocols", "gobject-introspection",
                    "libgirepository1.0-dev", "libgtk4-layer-shell-dev",
                ])
            ]),
        .target(
            name: "Gtk4LayerShell",
            dependencies: [
                "CGtk4LayerShell",
                .product(name: "Gtk", package: "swift-cross-ui"),
            ]),
        .testTarget(
            name: "Gtk4LayerShellTests",
            dependencies: ["Gtk4LayerShell"]
        ),
    ]
)
