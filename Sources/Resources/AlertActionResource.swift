//
//  AlertActionResource.swift
//  Resource
//
//  Created by Justin Jia on 12/5/16.
//  Copyright © 2016 TintPoint. MIT license.
//

/// A protocol that describes an item that can represent an alert action.
public protocol AlertActionDescribing {

    /// The `String` that represents the title of the alert action.
    var title: String? { get }

    /// The `UIAlertActionStyle` that represents the style of the alert action.
    var style: UIAlertActionStyle { get }

    /// The closure that represents the handler of the alert action.
    var handler: ((UIAlertAction) -> Void)? { get }

}

public extension AlertActionDescribing {

    var title: String? {
        return nil
    }

    var style: UIAlertActionStyle {
        return .default
    }

    var handler: ((UIAlertAction) -> Void)? {
        return nil
    }

}

/// A struct that describes an item that can represent an alert action.
public struct AlertActionDescription: AlertActionDescribing {

    /// The `String` that represents the title of the alert action.
    public let title: String?

    /// The `UIAlertActionStyle` that represents the style of the alert action.
    public let style: UIAlertActionStyle

    /// The closure that represents the handler of the alert action.
    public let handler: ((UIAlertAction) -> Void)?

    public init(title: String? = nil, style: UIAlertActionStyle = .default, handler: ((UIAlertAction) -> Void)? = nil) {
        self.title = title
        self.style = style
        self.handler = handler
    }

}

public extension Resource {

    /// Returns a `UIAlertAction` that is represented by the item that conforms to `AlertActionDescribing`.
    /// - Parameter describing: An item that conforms to `AlertActionDescribing`.
    /// - Returns: A represented alert action.
    static func of(_ describing: AlertActionDescribing) -> UIAlertAction {
        return UIAlertAction(title: describing.title, style: describing.style, handler: describing.handler)
    }

}
