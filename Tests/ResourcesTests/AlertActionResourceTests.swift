//
//  AlertActionResourceTests.swift
//  Tests
//
//  Created by Justin Jia on 12/5/16.
//  Copyright © 2016 TintPoint. MIT license.
//

@testable import Resource
import XCTest

enum AppAlertAction {
    case test
}

extension AppAlertAction: AlertActionDescribing {
    var title: String? {
        return "Test"
    }

    var style: UIAlertActionStyle {
        return .default
    }

    var handler: ((UIAlertAction) -> Void)? {
        return { _ in }
    }
}

class AlertActionResourceTests: XCTestCase {
    func testAlertActionProtocolResource() {
        let action = Resource.of(AppAlertAction.test)
        XCTAssertEqual(action.title, "Test")
        XCTAssertEqual(action.style, .default)
    }

    func testAlertActionStructResource() {
        let action = Resource.of(AlertActionDescription(title: "Title", style: .cancel, handler: nil))
        XCTAssertEqual(action.title, "Title")
        XCTAssertEqual(action.style, .cancel)
    }
}
