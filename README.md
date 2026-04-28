[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT) [![CI](https://github.com/DuetHealth/DrX/actions/workflows/ci.yml/badge.svg)](https://github.com/DuetHealth/DrX/actions/workflows/ci.yml)

# DrX

DrX is a collection of convenience extensions of RxSwift which add new operators for concisely handling common patterns and/or scenarios. In addition to an agnostic core, DrX also supports iOS RxCocoa.

## Usage

### Installation

Swift Package Manager:

```swift
.package(url: "https://github.com/DuetHealth/DrX.git", from: "5.0.0")
```

### Running tests

```bash
xcodebuild test -scheme DrX -destination 'platform=iOS Simulator,name=iPhone 17 Pro,OS=latest'
```

## License

DrX is MIT-licensed. The [MIT license](LICENSE) is included in the root of the repository.
