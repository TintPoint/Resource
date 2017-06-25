# Resource

[![Build Status](https://img.shields.io/travis/TintPoint/Resource.svg)](https://travis-ci.org/TintPoint/Resource)
[![Carthage Compatible](https://img.shields.io/badge/carthage-compatible-4BC51D.svg)](https://github.com/Carthage/Carthage)
[![CocoaPods Compatible](https://img.shields.io/cocoapods/v/Resource.svg)](https://cocoapods.org)

Resource helps you to manage your project resources.

**Note**: Resource is still under development and many things are subject to change.

## Features

- [x] Protocol oriented design
- [x] Comprehensive unit test coverage
- [x] [Complete documentation](http://cocoadocs.org/docsets/Resource)

## Requirements

iOS 10+ / Xcode 9+ / Swift 4+

## Installation

### Carthage

[Carthage](https://github.com/Carthage/Carthage) is a decentralized dependency manager. To install Resource, add the following line to your `Cartfile`:

```ogdl
github "TintPoint/Resource" "swift-4.0"
```

### CocoaPods

[CocoaPods](https://cocoapods.org) is a centralized dependency manager. To install Resource, add the following line to your `Podfile`:

```ruby
pod 'Resource', :git => 'https://github.com/TintPoint/Resource.git', :branch => 'swift-4.0'
```

## Getting Started

Define a custom enum that conforms to protocols with `Describing` postfix (list of available protocols can be found [here](#available-protocols)). For example, to manage all alert controllers, write the following code.


```swift
enum Alert: AlertControllerDescribing {
    case databaseError, networkError
    var title: String {
        return rawValue.capitalized
    }
    var message: String {
        switch self {
        case .databaseError: return "Please try again."
        case .networkError: return "Please check your network connection."
        }
    }
    var actions: [UIAlertAction] {
        return [UIAlertAction(title: "OK", style: .default)]
    }
}
```

```swift
let alert = Resource.of(Alert.databaseError)
present(alert, animated: true)
```

## Reference

### Available Protocols

> - AlertActionDescribing
> - AlertControllerDescribing
> - LocalizedStringDescribing
> - LocalizedUserNotificationStringDescribing
> - StoryboardDescribing
> - StringDescribing
> - ViewControllerDescribing
