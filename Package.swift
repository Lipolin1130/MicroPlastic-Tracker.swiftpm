// swift-tools-version: 6.0

// WARNING:
// This file is automatically generated.
// Do not edit it by hand because the contents will be replaced.

import PackageDescription
import AppleProductTypes

let package = Package(
    name: "MicroPlastic Tracker",
    platforms: [
        .iOS("16.0")
    ],
    products: [
        .iOSApplication(
            name: "MicroPlastic Tracker",
            targets: ["AppModule"],
            bundleIdentifier: "Polin.MicroPlastic-Tracker",
            teamIdentifier: "F2X8LZ547C",
            displayVersion: "1.0",
            bundleVersion: "1",
            appIcon: .asset("AppIcon"),
            accentColor: .presetColor(.orange),
            supportedDeviceFamilies: [
                .pad,
                .phone
            ],
            supportedInterfaceOrientations: [
                .portrait,
                .landscapeRight,
                .landscapeLeft,
                .portraitUpsideDown(.when(deviceFamilies: [.pad]))
            ],
            capabilities: [
                .incomingNetworkConnections(),
                .outgoingNetworkConnections(),
                .fileAccess(.userSelectedFiles, mode: .readWrite),
                .fileAccess(.downloadsFolder, mode: .readWrite),
                .fileAccess(.pictureFolder, mode: .readWrite),
                .fileAccess(.musicFolder, mode: .readWrite),
                .fileAccess(.moviesFolder, mode: .readWrite)
            ]
        )
    ],
    targets: [
        .executableTarget(
            name: "AppModule",
            path: "."
        )
    ],
    swiftLanguageVersions: [.version("6")]
)