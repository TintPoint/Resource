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

    /// The `String` that represents the table name of the localized string.
    var tableName: String? { get }

    /// The `Bundle` that represents the bundle of the localized string.
    var bundle: Bundle { get }

    /// The `String` that represents the value of the localized string.
    var value: String { get }

    /// The `String` that represents the comment of the localized string.
    var comment: String { get }

    /// The array of `Any` that represents the arguments of the localized string.
    var arguments: [Any]? { get }
}

public extension LocalizedStringDescribing {
    var tableName: String? {
        return nil
    }

    var bundle: Bundle {
        return .main
    }

    var value: String {
        return ""
    }

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

    /// The `String` that represents the table name of the localized string.
    public let tableName: String?

    /// The `Bundle` that represents the bundle of the localized string.
    public let bundle: Bundle

    /// The `String` that represents the value of the localized string.
    public let value: String

    /// The `String` that represents the comment of the localized string.
    public let comment: String

    /// The array of `Any` that represents the arguments of the localized string.
    public let arguments: [Any]?

    public init(key: String, tableName: String? = nil, bundle: Bundle = .main, value: String = "", comment: String = "", arguments: [Any]? = nil) {
        self.key = key
        self.tableName = tableName
        self.bundle = bundle
        self.value = value
        self.comment = comment
        self.arguments = arguments
    }
}

public extension Resource {
    /// Returns a `String` that is represented by the item that conforms to `LocalizedStringDescribing`.
    /// - Parameter describing: An item that conforms to `LocalizedStringDescribing`.
    /// - Returns: A represented localized string.
    static func of(_ describing: LocalizedStringDescribing) -> String {
        let localizedString = NSLocalizedString(describing.key, tableName: describing.tableName, bundle: describing.bundle, value: describing.value, comment: describing.comment)
        guard let arguments = describing.arguments as? [CVarArg] else {
            return localizedString
        }
        return String(format: localizedString, arguments: arguments)
    }
}
