//
//  StoryboardResource.swift
//  Resource
//
//  Created by Justin Jia on 11/14/16.
//  Copyright © 2016 TintPoint. MIT license.
//

/// A protocol that describes an item that can represent a storyboard.
public protocol StoryboardDescribing {

    /// The `String` that will be used to represent the name of the storyboard.
    var name: String { get }

    /// The `Bundle` that will be used to represent the bundle of the storyboard.
    var bundle: Bundle { get }

}

/// A struct that describes an item that can represent a storyboard.
public struct StoryboardDescription: StoryboardDescribing {

    /// The `String` that will be used to represent the name of the storyboard.
    public let name: String

    /// The `Bundle` that will be used to represent the bundle of the storyboard.
    public let bundle: Bundle

}

public extension Resource {

    /// Returns a `UIStoryboard` that is represented by the item that conforms to `StoryboardDescribing`.
    /// - Parameter describing: An item that conforms to `StoryboardDescribing`.
    /// - Returns: A represented storyboard.
    static func of(_ describing: StoryboardDescribing) -> UIStoryboard {
        return UIStoryboard(name: describing.name, bundle: describing.bundle)
    }

}
