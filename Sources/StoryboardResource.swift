//
//  StoryboardResource.swift
//  Resource
//
//  Created by Justin Jia on 11/14/16.
//  Copyright © 2016 TintPoint. MIT license.
//

public protocol StoryboardDescribing {

    var name: String { get }
    var bundle: Bundle { get }

}

public extension Resource {

    static func of(_ describing: StoryboardDescribing) -> UIStoryboard {
        return UIStoryboard(name: describing.name, bundle: describing.bundle)
    }

}
