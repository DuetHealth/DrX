// swift-tools-version:4.0

import PackageDescription

let package = Package(
    name: "DrX",
    products: [.library(name: "DrX", targets: ["DrX"])],
    dependencies: [.package(url: "https://github.com/ReactiveX/RxSwift.git", "4.0.0" ..< "5.0.0")],
    targets: [.target(name: "DrX", dependencies: ["RxSwift"], path: "Sources/DrX")]
)
