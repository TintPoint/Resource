//
//  LocalizedStringResource.swift
//  Resource
//
//  Created by Justin Jia on 11/6/16.
//  Copyright © 2016 TintPoint. MIT license.
//

public protocol LocalizedStringDescribing {

    var key: String { get }
    var comment: String { get }
    var arguments: [Any]? { get }

}

public extension LocalizedStringDescribing {

    var comment: String {
        return ""
    }

    var arguments: [Any]? {
        return nil
    }

}

public extension Resource {

    static func of(_ describing: LocalizedStringDescribing) -> String {
        let localizedString = NSLocalizedString(describing.key, comment: describing.comment)
        guard let arguments = describing.arguments as? [CVarArg] else { return localizedString }
        return String(format: localizedString, arguments: arguments)
    }
    
}
