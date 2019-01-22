[![Build Status](https://travis-ci.org/DuetHealth/DrX.svg?branch=master)](https://travis-ci.org/DuetHealth/DrX)

# DrX

DrX is a collection of convenience extensions of RxSwift which add new operators for concisely handling common patterns and/or scenarios. In addition to an agnostic core, DrX also supports iOS RxCocoa.


## Usage

### Installation

Cocoapods: `pod 'DrX', '~> 2.0'`. See [DrX.podspec](DrX.podspec) for more information.

Carthage: `github "DuetHealth/DrX" ~> 2.0 && carthage update`

Swift Package Manager: `.package(url: "https://github.com/DuetHealth/DrX.git", "2.0.0" ..< "3.0.0")`

### Running tests

Run the command `pod install` to install the project's test dependencies and generate the workspace. Open `DrX.xcworkspace`, select the framework target, and press `⌘ + U` to execute the test action of the target.

## License

DrX is MIT-licensed. The [MIT license](LICENSE) is included in the root of the repository.
