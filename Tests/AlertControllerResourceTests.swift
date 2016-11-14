//
//  AlertControllerResourceTests.swift
//  Resource
//
//  Created by Justin Jia on 11/14/16.
//  Copyright © 2016 TintPoint. MIT license.
//

import XCTest
@testable import Resource

enum AlertControllerDescription: String {

    case test

}

extension AlertControllerDescription: AlertControllerDescribing {

    var title: String {
        return rawValue.capitalized
    }

    var message: String {
        switch self {
        case .test: return "Test Message"
        }
    }

    var style: UIAlertControllerStyle {
        return .actionSheet
    }

}

class AlertControllerResourceTests: XCTestCase {

    func testAlertControllerResource() {
        let controller = Resource.of(AlertControllerDescription.test)
        XCTAssertEqual(controller.title, "Test")
        XCTAssertEqual(controller.message, "Test Message")
        XCTAssertEqual(controller.preferredStyle, .actionSheet)
    }
    
}
