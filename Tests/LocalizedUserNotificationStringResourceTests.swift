//
//  LocalizedUserNotificationStringResourceTests.swift
//  Resource
//
//  Created by Justin Jia on 11/14/16.
//  Copyright © 2016 TintPoint. MIT license.
//

import XCTest
@testable import Resource

enum LocalizedUserNotificationStringDescription {

    case test(argument: String?)

}

extension LocalizedUserNotificationStringDescription: LocalizedStringDescribing {

    var key: String {
        switch self {
        case .test(let argument) where argument != nil: return "With Argument %@"
        case .test: return "No Argument"
        }
    }

    var arguments: [Any]? {
        switch self {
        case .test(let argument) where argument != nil: return [argument!]
        case .test: return nil
        }
    }

}

class LocalizedUserNotificationStringResourceTests: XCTestCase {

    func testLocalizedUserNotificationStringResource() {
        XCTAssertEqual(Resource.of(LocalizedStringDescription.test(argument: "A")), "With Argument A")
        XCTAssertEqual(Resource.of(LocalizedStringDescription.test(argument: nil)), "No Argument")
    }
    
}
