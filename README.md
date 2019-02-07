# tmdb.swift [![Build Status](https://travis-ci.com/amebalabs/tmdb.swift.svg?branch=master)](https://travis-ci.com/amebalabs/tmdb.swift) ![Swift Support](https://img.shields.io/badge/Swift-4.2-orange.svg) [![Carthage compatible](https://img.shields.io/badge/Carthage-compatible-4BC51D.svg?style=flat)](https://github.com/Carthage/Carthage)

https://www.themoviedb.org API wrapper

## Table of Contents
- [Requirements](https://github.com/amebalabs/ImageSlider/#requirements)
- [Installation](https://github.com/amebalabs/ImageSlider/#nstallation)
- [Usage](https://github.com/amebalabs/ImageSlider/#usage)
- [Example](https://github.com/amebalabs/ImageSlider/#example)
- [Author](https://github.com/amebalabs/ImageSlider/#author)

---

## Requirements

- Swift 4.2
- Xcode 10 or greater
- iOS 11.0 or greater

## Installation

### CocoaPods

AppVersion is available through [CocoaPods](http://cocoapods.org). To install it add the following line to your Podfile:

```ruby
pod "tmdb.swift"
```

### Carthage

If you’re using [Carthage](https://github.com/Carthage/Carthage), add tmdb.swift to your `Cartfile`:

```
github "amebalabs/tmdb.swift"
```
Make sure to add `tmdb_swift.framework` to "Linked Frameworks and Libraries" and "copy-frameworks" Build Phases.

## Usage
### Set the API key
To retrieve a key follow instructions https://developers.themoviedb.org/3/getting-started/authentication

You can set the API key in tmdb.swift in two ways:
1. add `TMDB_API_KEY` to Info.plist of your app
2. or set `TMDB.apiKey` before you use API
    
### Call API


### Options
## Example
Check example project in this repository
## Author
- Website: [Ameba](https://ameba.co) 
- Gtihub [@amebalabs](https://github.com/amebalabs/)
## License

tmdb.swift is available under the MIT license. See the LICENSE file for more info.
