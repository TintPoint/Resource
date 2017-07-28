//
//  LocalizedStringResource.swift
//  Resource
//
//  Created by Justin Jia on 11/6/16.
//  Copyright © 2016 TintPoint. MIT license.
//

/// A protocol that describes an item that can represent a localized string.
public protocol LocalizedStringDescribing {

    /// The `String` that represents the key of the localized string.
    var key: String { get }

    /// The `String` that represents the comment of the localized string.
    var comment: String { get }

    /// The array of `Any` that represents the arguments of the localized string.
    var arguments: [Any]? { get }

}

public extension LocalizedStringDescribing {

    var comment: String {
        return ""
    }

    var arguments: [Any]? {
        return nil
    }

}

/// A struct that describes an item that can represent a localized string.
public struct LocalizedStringDescription: LocalizedStringDescribing {

    /// The `String` that represents the key of the localized string.
    public let key: String

    /// The `String` that represents the comment of the localized string.
    public let comment: String

    /// The array of `Any` that represents the arguments of the localized string.
    public let arguments: [Any]?

    public init(key: String, comment: String = "", arguments: [Any]? = nil) {
        self.key = key
        self.comment = comment
        self.arguments = arguments
    }

}

public extension Resource {

    /// Returns a `String` that is represented by the item that conforms to `LocalizedStringDescribing`.
    /// - Parameter describing: An item that conforms to `LocalizedStringDescribing`.
    /// - Returns: A represented localized string.
    static func of(_ describing: LocalizedStringDescribing) -> String {
        let localizedString = NSLocalizedString(describing.key, comment: describing.comment)
        guard let arguments = describing.arguments as? [CVarArg] else {
            return localizedString
        }
        return String(format: localizedString, arguments: arguments)
    }

}
