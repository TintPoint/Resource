//
//  StoryboardResource.swift
//  Resource
//
//  Created by Justin Jia on 11/14/16.
//  Copyright © 2016 TintPoint. MIT license.
//

/// A protocol that describes an item that can represent a storyboard.
public protocol StoryboardDescribing {
    /// The `String` that represents the name of the storyboard.
    var name: String { get }

    /// The `Bundle` that represents the bundle of the storyboard.
    var bundle: Bundle { get }
}

public extension StoryboardDescribing {
    var bundle: Bundle {
        return Bundle.main
    }
}

/// A struct that describes an item that can represent a storyboard.
public struct StoryboardDescription: StoryboardDescribing {
    /// The `String` that represents the name of the storyboard.
    public let name: String

    /// The `Bundle` that represents the bundle of the storyboard.
    public let bundle: Bundle

    public init(name: String, bundle: Bundle = Bundle.main) {
        self.name = name
        self.bundle = bundle
    }
}

public extension Resource {
    /// Returns a `UIStoryboard` that is represented by the item that conforms to `StoryboardDescribing`.
    /// - Parameter describing: An item that conforms to `StoryboardDescribing`.
    /// - Returns: A represented storyboard.
    static func of(_ describing: StoryboardDescribing) -> UIStoryboard {
        return UIStoryboard(name: describing.name, bundle: describing.bundle)
    }
}
