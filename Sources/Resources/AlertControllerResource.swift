//
//  AlertControllerResource.swift
//  Resource
//
//  Created by Justin Jia on 11/14/16.
//  Copyright © 2016 TintPoint. MIT license.
//

/// A protocol that describes an item that can represent an alert controller.
public protocol AlertControllerDescribing {
    /// The `String` that represents the title of the alert controller.
    var title: String? { get }

    /// The `String` that represents the message of the alert controller.
    var message: String? { get }

    /// The `UIAlertController.Style` that represents the style of the alert controller.
    var style: UIAlertController.Style { get }

    /// The array of `UIAlertAction` that represents the actions of the alert controller.
    var actions: [UIAlertAction] { get }
}

public extension AlertControllerDescribing {
    var title: String? {
        return nil
    }

    var message: String? {
        return nil
    }

    var style: UIAlertController.Style {
        return .alert
    }
}

/// A struct that describes an item that can represent an alert controller.
public struct AlertControllerDescription: AlertControllerDescribing {
    /// The `String` that represents the title of the alert controller.
    public let title: String?

    /// The `String` that represents the message of the alert controller.
    public let message: String?

    /// The `UIAlertController.Style` that represents the style of the alert controller.
    public let style: UIAlertController.Style

    /// The array of `UIAlertAction` that represents the actions of the alert controller.
    public let actions: [UIAlertAction]

    public init(title: String? = nil, message: String? = nil, style: UIAlertController.Style = .alert, actions: [UIAlertAction]) {
        self.title = title
        self.message = message
        self.style = style
        self.actions = actions
    }
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
