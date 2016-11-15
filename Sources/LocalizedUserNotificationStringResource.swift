//
//  LocalizedUserNotificationStringResource.swift
//  Resource
//
//  Created by Justin Jia on 11/14/16.
//  Copyright © 2016 TintPoint. MIT license.
//

import UserNotifications

/// A protocol that describes an item that can represent a localized user notification string.
@available(iOSApplicationExtension 10.0, *)
public protocol LocalizedUserNotificationStringDescribing {

    /// The `String` that will be used to represent the key of the localized user notification string.
    var key: String { get }

    /// The array of `Any` that will be used to represent the arguments of the localized user notification string.
    var arguments: [Any]? { get }

}

@available(iOSApplicationExtension 10.0, *)
public extension LocalizedUserNotificationStringDescribing {

    var arguments: [Any]? {
        return nil
    }

}

@available(iOSApplicationExtension 10.0, *)
public extension Resource {

    /// Returns a `String` that is represented by the item that conforms to `LocalizedUserNotificationStringDescribing`.
    /// - Parameter describing: An item that conforms to `LocalizedUserNotificationStringDescribing`.
    /// - Returns: A represented localized user notification string.
    static func of(_ describing: LocalizedUserNotificationStringDescribing) -> String {
        return NSString.localizedUserNotificationString(forKey: describing.key, arguments: describing.arguments)
    }
    
}
