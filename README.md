TBXML-NSDictionary
==================

TBXML+NSDictionary

## Getting Started

Check out the example project that is included in the repository.

## Requirements

TBXML+NSDictionary requires Xcode 4.4 with either the [iOS 5.0](http://developer.apple.com/library/ios/#releasenotes/General/WhatsNewIniPhoneOS/Articles/iOS5.html) ([64-bit with modern Cocoa runtime](https://developer.apple.com/library/mac/#documentation/Cocoa/Conceptual/ObjCRuntimeGuide/Articles/ocrtVersionsPlatforms.html)) SDK, as well as [TBXML](https://github.com/71squared/TBXML) 1.5 or higher.

## Installation

[CocoaPods](http://cocoapods.org) is the recommended way to add TBXML+NSDictionary to your project.

Here's an example podfile that installs TBXML+NSDictionary and its dependency, TBXML. 
### Podfile

```ruby
platform :ios, '5.0'

pod 'TBXML+NSDictionary', '0.0.1'
```

Note the specification of iOS 5.0 as the platform; leaving out the 5.0 will cause CocoaPods to fail with the following message:

> [!] TBXML+NSDictionary is not compatible with iOS 4.3.

## License

TBXML+NSDictionary is available under the WTFPL license. See the LICENSE file for more info.
