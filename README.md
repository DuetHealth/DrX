[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT) [![Swift Package Manager](https://github.com/DuetHealth/DrX/workflows/Swift%20Package%20Manager/badge.svg)](https://github.com/DuetHealth/DrX/actions?query=workflow%3A%22Swift+Package+Manager%22) [![Carthage](https://github.com/DuetHealth/DrX/workflows/Carthage/badge.svg)](https://github.com/DuetHealth/DrX/actions?query=workflow%3ACarthage) [![Cocoapods](https://github.com/DuetHealth/DrX/workflows/Cocoapods/badge.svg)](https://github.com/DuetHealth/DrX/actions?query=workflow%3ACocoapods)

# DrX

DrX is a collection of convenience extensions of RxSwift which add new operators for concisely handling common patterns and/or scenarios. In addition to an agnostic core, DrX also supports iOS RxCocoa.


## Usage

### Installation

Cocoapods: `pod 'DrX', '~> 3.0'`. See [DrX.podspec](DrX.podspec) for more information.

Carthage: `github "DuetHealth/DrX" ~> 3.0 && carthage update`

Swift Package Manager: `.package(url: "https://github.com/DuetHealth/DrX.git", "3.0.0" ..< "4.0.0")`

### Running tests

Run the command `pod install` to install the project's test dependencies and generate the workspace. Open `DrX.xcworkspace`, select the framework target, and press `⌘ + U` to execute the test action of the target.

## License

DrX is MIT-licensed. The [MIT license](LICENSE) is included in the root of the repository.
