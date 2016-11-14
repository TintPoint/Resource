//
//  ViewControllerResource.swift
//  Resource
//
//  Created by Justin Jia on 11/14/16.
//  Copyright © 2016 TintPoint. MIT license.
//

public protocol ViewControllerDescribing {

    var name: String { get }
    var storyboard: UIStoryboard { get }
    
}

public extension Resource {

    static func of(_ describing: ViewControllerDescribing) -> UIViewController {
        return describing.storyboard.instantiateViewController(withIdentifier: describing.name)
    }
    
}
