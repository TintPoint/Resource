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

public extension Resource {

    /// Returns a `UIViewController` that is represented by the item that conforms to `ViewControllerDescribing`.
    /// - Parameter describing: An item that conforms to `ViewControllerDescribing`.
    /// - Returns: A represented view controller.
    static func of(_ describing: ViewControllerDescribing) -> UIViewController {
        return describing.storyboard.instantiateViewController(withIdentifier: describing.name)
    }
    
}
