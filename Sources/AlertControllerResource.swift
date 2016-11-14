//
//  AlertControllerResource.swift
//  Resource
//
//  Created by Justin Jia on 11/14/16.
//  Copyright © 2016 TintPoint. MIT license.
//

public protocol AlertControllerDescribing {

    var title: String { get }
    var message: String { get }
    var style: UIAlertControllerStyle { get }

}

extension AlertControllerDescribing {

    var message: String {
        return ""
    }

    var style: UIAlertControllerStyle {
        return .alert
    }

}

public extension Resource {

    static func of(_ describing: AlertControllerDescribing) -> UIAlertController {
        return UIAlertController(title: describing.title, message: describing.message, preferredStyle: describing.style)
    }
    
}
