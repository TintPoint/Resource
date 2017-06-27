//
//  ViewControllerResource.swift
//  Resource
//
//  Created by Justin Jia on 11/14/16.
//  Copyright © 2016 TintPoint. MIT license.
//

/// A protocol that describes an item that can represent a view controller.
public protocol ViewControllerDescribing {

    /// The `String` that will be used to represent the name of the view controller.
    var name: String { get }

    /// The `UIStoryboard` that will be used to represent the storyboard of the view controller.
    var storyboard: UIStoryboard { get }
    
}

/// A struct that describes an item that can represent a view controller.
public struct ViewControllerDescription: ViewControllerDescribing {

    /// The `String` that will be used to represent the name of the view controller.
    public let name: String

    /// The `UIStoryboard` that will be used to represent the storyboard of the view controller.
    public let storyboard: UIStoryboard

    public init(name: String, storyboard: UIStoryboard) {
        self.name = name
        self.storyboard = storyboard
    }

}

/// A protocol that describes a view controller that is represented by a `ViewControllerDescribing` protocol.
public protocol CustomViewController {

    static var representedBy: ViewControllerDescribing { get }

}

public extension Resource {

    /// Returns a `UIViewController` that is represented by the item that conforms to `ViewControllerDescribing`.
    /// - Parameter describing: An item that conforms to `ViewControllerDescribing`.
    /// - Returns: A represented view controller.
    static func of(_ describing: ViewControllerDescribing) -> UIViewController {
        return describing.storyboard.instantiateViewController(withIdentifier: describing.name)
    }

    /// Returns a `CustomViewController` that is represented by its class.
    /// - Parameter viewControllerClass: An `UIViewController` that conforms to `CustomViewController`.
    /// - Returns: A represented `CustomViewController`.
    static func of<T: UIViewController & CustomViewController>(_ viewControllerClass: T.Type) -> T {
        return Resource.of(viewControllerClass.representedBy) as! T
    }
    
}

