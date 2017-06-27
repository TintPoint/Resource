//
//  AlertControllerResource.swift
//  Resource
//
//  Created by Justin Jia on 11/14/16.
//  Copyright © 2016 TintPoint. MIT license.
//

/// A protocol that describes an item that can represent an alert controller.
public protocol AlertControllerDescribing {

    /// The `String` that will be used to represent the title of the alert controller.
    var title: String { get }

    /// The `String` that will be used to represent the message of the alert controller.
    var message: String { get }

    /// The `UIAlertControllerStyle` that will be used to represent the style of the alert controller.
    var style: UIAlertControllerStyle { get }

    /// The array of `UIAlertAction` that will be used to represent the actions of the alert controller.
    var actions: [UIAlertAction] { get }

}

public extension AlertControllerDescribing {

    var message: String {
        return ""
    }

    var style: UIAlertControllerStyle {
        return .alert
    }

}

/// A struct that describes an item that can represent an alert controller.
public struct AlertControllerDescription: AlertControllerDescribing {

    /// The `String` that will be used to represent the title of the alert controller.
    public let title: String

    /// The `String` that will be used to represent the message of the alert controller.
    public let message: String

    /// The `UIAlertControllerStyle` that will be used to represent the style of the alert controller.
    public let style: UIAlertControllerStyle

    /// The array of `UIAlertAction` that will be used to represent the actions of the alert controller.
    public let actions: [UIAlertAction]

}

public extension Resource {

    /// Returns a `UIAlertController` that is represented by the item that conforms to `AlertControllerDescribing`.
    /// - Parameter describing: An item that conforms to `AlertControllerDescribing`.
    /// - Returns: A represented alert controller.
    static func of(_ describing: AlertControllerDescribing) -> UIAlertController {
        let controller = UIAlertController(title: describing.title, message: describing.message, preferredStyle: describing.style)
        describing.actions.forEach { controller.addAction($0) }
        return controller
    }
    
}
