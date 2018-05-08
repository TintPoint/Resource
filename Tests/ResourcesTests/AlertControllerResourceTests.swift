//
//  AlertControllerResourceTests.swift
//  Tests
//
//  Created by Justin Jia on 11/14/16.
//  Copyright © 2016 TintPoint. MIT license.
//

@testable import Resource
import XCTest

enum AppAlertController {
    case test
}

extension AppAlertController: AlertControllerDescribing {
    var title: String? {
        return "Test"
    }

    var message: String? {
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
    func testAlertControllerProtocolResource() {
        let controller = Resource.of(AppAlertController.test)
        XCTAssertEqual(controller.title, "Test")
        XCTAssertEqual(controller.message, "Test Message")
        XCTAssertEqual(controller.preferredStyle, .actionSheet)
        XCTAssertEqual(controller.actions.count, 1)
        XCTAssertEqual(controller.actions.first?.title, "TestAction")
    }

    func testAlertControllerStructResource() {
        let controller = Resource.of(AlertControllerDescription(title: "Title", message: "Message", style: .alert, actions: [UIAlertAction(title: "Action", style: .default)]))
        XCTAssertEqual(controller.title, "Title")
        XCTAssertEqual(controller.message, "Message")
        XCTAssertEqual(controller.preferredStyle, .alert)
        XCTAssertEqual(controller.actions.count, 1)
        XCTAssertEqual(controller.actions.first?.title, "Action")
    }
}
