//
//  LocalizedUserNotificationStringResourceTests.swift
//  Tests
//
//  Created by Justin Jia on 11/14/16.
//  Copyright © 2016 TintPoint. MIT license.
//

import XCTest
@testable import Resource

enum AppLocalizedUserNotificationString {

    case test(argument: String?)

}

extension AppLocalizedUserNotificationString: LocalizedUserNotificationStringDescribing {

    var key: String {
        switch self {
        case .test(let argument) where argument != nil: return "With Argument"
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

    func testLocalizedUserNotificationStringProtocolResource() {
        XCTAssertEqual(Resource.of(AppLocalizedUserNotificationString.test(argument: "A")), "With Argument")
        XCTAssertEqual(Resource.of(AppLocalizedUserNotificationString.test(argument: nil)), "No Argument")
    }

    func testLocalizedUserNotificationStringStructResource() {
        XCTAssertEqual(Resource.of(LocalizedUserNotificationStringDescription(key: "Key", arguments: ["X"])), "Key")
        XCTAssertEqual(Resource.of(LocalizedUserNotificationStringDescription(key: "Key", arguments: nil)), "Key")
    }
    
}
