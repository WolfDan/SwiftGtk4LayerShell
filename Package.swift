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
        .package(url: "https://github.com/rhx/gir2swift.git", branch: "main"),
        .package(url: "https://github.com/rhx/SwiftGtk.git", branch: "gtk4"),
        .package(url: "https://github.com/rhx/SwiftGdk.git", branch: "gtk4"),
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
                .product(name: "gir2swift", package: "gir2swift"),
                .product(name: "Gtk", package: "SwiftGtk"),
                .product(name: "Gdk", package: "SwiftGdk"),
            ],
            swiftSettings: [
                .unsafeFlags(["-suppress-warnings"], .when(configuration: .release)),
                .unsafeFlags(
                    ["-suppress-warnings", "-Xfrontend", "-serialize-debugging-options"],
                    .when(configuration: .debug)),
            ],
            plugins: [
                .plugin(name: "gir2swift-plugin", package: "gir2swift")
            ]),
        .testTarget(
            name: "Gtk4LayerShellTests",
            dependencies: ["Gtk4LayerShell"]
        ),
    ]
)
