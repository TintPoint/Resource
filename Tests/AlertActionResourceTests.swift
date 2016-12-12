//
//  AlertActionResourceTests.swift
//  Resource
//
//  Created by Justin Jia on 12/5/16.
//  Copyright © 2016 TintPoint. MIT license.
//

import XCTest
@testable import Resource

enum AppAlertAction: String {

    case test

}

extension AppAlertAction: AlertActionDescribing {

    var title: String {
        return rawValue.capitalized
    }

    var style: UIAlertActionStyle {
        return .default
    }

    var handler: ((UIAlertAction) -> ())? {
        return { _ in }
    }

}

class AlertActionResourceTests: XCTestCase {

    func testAlertActionResource() {
        let action = Resource.of(AppAlertAction.test)
        XCTAssertEqual(action.title, "Test")
        XCTAssertEqual(action.style, .default)
    }
    
}
