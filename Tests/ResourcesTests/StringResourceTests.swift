//
//  StringResourceTests.swift
//  Tests
//
//  Created by Justin Jia on 11/6/16.
//  Copyright © 2016 TintPoint. MIT license.
//

@testable import Resource
import XCTest

enum AppString {
    case test
}

extension AppString: StringDescribing {
    var content: String {
        return "Test"
    }
}

class StringResourceTests: XCTestCase {
    func testStringProtocolResource() {
        XCTAssertEqual(Resource.of(AppString.test), "Test")
    }

    func testStringStructResource() {
        XCTAssertEqual(Resource.of(StringDescription(content: "Content")), "Content")
    }
}
