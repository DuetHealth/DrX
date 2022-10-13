// swift-tools-version:5.1

import PackageDescription

let package = Package(
    name: "DrX",
    platforms: [.iOS(.v12)],
    products: [.library(name: "DrX", targets: ["DrX"])],
    dependencies: [.package(url: "https://github.com/ReactiveX/RxSwift.git", .exact("6.0.0")),
                   .package(url: "https://github.com/Quick/Nimble.git", from: "8.0.0"),
                   .package(url: "https://github.com/Quick/Quick.git", from: "2.2.0"),
                  ],
    targets: [
        .target(name: "DrX", dependencies: ["RxSwift", "RxCocoa", "RxRelay"], path: "DrX/Sources", exclude: ["DrX.h"]),
        .testTarget(name: "DrXTests", dependencies: ["DrX", "Nimble", "Quick"], path: "DrXTests/Sources"),
    ]
)
