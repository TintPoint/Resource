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

    var actions: [UIAlertAction] {
        return [UIAlertAction(title: "TestAction", style: .default)]
    }

}

class AlertControllerResourceTests: XCTestCase {

    func testAlertControllerResource() {
        let controller = Resource.of(AlertControllerDescription.test)
        XCTAssertEqual(controller.title, "Test")
        XCTAssertEqual(controller.message, "Test Message")
        XCTAssertEqual(controller.preferredStyle, .actionSheet)
        XCTAssertEqual(controller.actions.count, 1)
        XCTAssertEqual(controller.actions.first?.title, "TestAction")
    }
    
}
