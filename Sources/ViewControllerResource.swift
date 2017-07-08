//
//  ViewControllerResource.swift
//  Resource
//
//  Created by Justin Jia on 11/14/16.
//  Copyright © 2016 TintPoint. MIT license.
//

/// A protocol that describes an item that can represent a view controller.
public protocol ViewControllerDescribing {

    /// The `String` that represents the name of the view controller.
    var name: String { get }

    /// The `UIStoryboard` that represents the storyboard of the view controller.
    var storyboard: UIStoryboard { get }

}

/// A struct that describes an item that can represent a view controller.
public struct ViewControllerDescription: ViewControllerDescribing {

    /// The `String` that represents the name of the view controller.
    public let name: String

    /// The `UIStoryboard` that represents the storyboard of the view controller.
    public let storyboard: UIStoryboard

    public init(name: String, storyboard: UIStoryboard) {
        self.name = name
        self.storyboard = storyboard
    }

}

/// A protocol that describes a view controller that is represented by a `ViewControllerDescribing`.
public protocol CustomViewController: AnyObject {

    /// The `ViewControllerDescribing` that represents the view controller.
    static var representedBy: ViewControllerDescribing { get }

}

/// A protocol that describes a view controller that can receive some data during initialization.
public protocol DataReceivingController: CustomViewController {

    /// An associated type that describes the type of the data that the view controller accepts.
    associatedtype TransferData

    /// The `TransferData` that stores the data transferred to the view controller.
    var transferData: TransferData { get set }

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

    /// Returns a `DataReceivingController` that is represented by its class.
    /// - Parameter viewControllerClass: An `UIViewController` that conforms to `DataReceivingController`.
    /// - Parameter data: A `TransferData` that the view controller accepts.
    /// - Returns: A represented `DataReceivingController`.
    static func of<T: UIViewController & DataReceivingController>(_ viewControllerClass: T.Type, passing data: T.TransferData) -> T {
        let controller = Resource.of(viewControllerClass.self)
        controller.transferData = data
        return controller
    }

}
