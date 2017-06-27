//
//  AlertActionResource.swift
//  Resource
//
//  Created by Justin Jia on 12/5/16.
//  Copyright © 2016 TintPoint. MIT license.
//

/// A protocol that describes an item that can represent an alert action.
public protocol AlertActionDescribing {

    /// The `String` that will be used to represent the title of the alert action.
    var title: String { get }

    /// The `UIAlertActionStyle` that will be used to represent the style of the alert action.
    var style: UIAlertActionStyle { get }

    var handler: ((UIAlertAction) -> Void)? { get }

}

public extension AlertActionDescribing {

    var style: UIAlertActionStyle {
        return .default
    }

    var handler: ((UIAlertAction) -> Void)? {
        return nil
    }

}

/// A struct that describes an item that can represent an alert action.
public struct AlertActionDescription: AlertActionDescribing {

    /// The `String` that will be used to represent the title of the alert action.
    public let title: String

    /// The `UIAlertActionStyle` that will be used to represent the style of the alert action.
    public let style: UIAlertActionStyle

    public let handler: ((UIAlertAction) -> Void)?

}

public extension Resource {

    /// Returns a `UIAlertAction` that is represented by the item that conforms to `AlertActionDescribing`.
    /// - Parameter describing: An item that conforms to `AlertActionDescribing`.
    /// - Returns: A represented alert action.
    static func of(_ describing: AlertActionDescribing) -> UIAlertAction {
        return UIAlertAction(title: describing.title, style: describing.style, handler: describing.handler)
    }
    
}
