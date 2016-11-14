//
//  LocalizedUserNotificationStringResource.swift
//  Resource
//
//  Created by Justin Jia on 11/14/16.
//  Copyright © 2016 TintPoint. MIT license.
//

import UserNotifications

@available(iOSApplicationExtension 10.0, *)
public protocol LocalizedUserNotificationStringDescribing {

    var key: String { get }
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

    static func of(_ describing: LocalizedUserNotificationStringDescribing) -> String {
        return NSString.localizedUserNotificationString(forKey: describing.key, arguments: describing.arguments)
    }
    
}
