// swift-tools-version:4.0

import PackageDescription

let package = Package(
    name: "DrX",
    products: [.library(name: "DrX", targets: ["DrX"])],
    dependencies: [.package(url: "https://github.com/ReactiveX/RxSwift.git", from: "5.0.0")],
    targets: [
        .target(name: "DrX", dependencies: ["RxSwift", "RxCocoa"], path: "DrX/Sources", exclude: ["DrX/Sources/DrX.h"])
    ]
)
