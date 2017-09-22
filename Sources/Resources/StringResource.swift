//
//  StringResource.swift
//  Resource
//
//  Created by Justin Jia on 11/6/16.
//  Copyright © 2016 TintPoint. MIT license.
//

/// A protocol that describes an item that can represent a string.
public protocol StringDescribing {

    /// The `String` that represents the content of the string.
    var content: String { get }

}

/// A struct that describes an item that can represent a string.
public struct StringDescription: StringDescribing {

    /// The `String` that represents the content of the string.
    public let content: String

    public init(content: String) {
        self.content = content
    }

}

public extension Resource {

    /// Returns a `String` that is represented by the item that conforms to `StringDescribing`.
    /// - Parameter describing: An item that conforms to `StringDescribing`.
    /// - Returns: A represented string.
    static func of(_ describing: StringDescribing) -> String {
        return describing.content
    }

}
