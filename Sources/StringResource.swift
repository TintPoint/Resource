//
//  StringResource.swift
//  Resource
//
//  Created by Justin Jia on 11/6/16.
//  Copyright © 2016 TintPoint. MIT license.
//

public protocol StringDescribing {

    var string: String { get }

}

public extension Resource {

    static func of(_ describing: StringDescribing) -> String {
        return describing.string
    }
    
}
