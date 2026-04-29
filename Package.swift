// swift-tools-version:6.2

import PackageDescription

let package = Package(
    name: "DrX",
    platforms: [.iOS(.v13)],
    products: [.library(name: "DrX", targets: ["DrX"])],
    dependencies: [
        .package(url: "https://github.com/ReactiveX/RxSwift.git", from: "6.0.0"),
        .package(url: "https://github.com/Quick/Nimble.git", from: "13.0.0"),
        .package(url: "https://github.com/Quick/Quick.git", from: "7.0.0"),
    ],
    targets: [
        .target(
            name: "DrX",
            dependencies: [
                .product(name: "RxSwift", package: "RxSwift"),
                .product(name: "RxCocoa", package: "RxSwift"),
                .product(name: "RxRelay", package: "RxSwift"),
            ],
            path: "DrX/Sources",
            exclude: ["DrX.h"]
        ),
        .testTarget(
            name: "DrXTests",
            dependencies: [
                "DrX",
                .product(name: "Nimble", package: "Nimble"),
                .product(name: "Quick", package: "Quick"),
            ],
            path: "DrXTests/Sources"
        ),
    ]
)
