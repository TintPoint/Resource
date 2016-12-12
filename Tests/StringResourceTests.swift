//
//  StringResourceTests.swift
//  Resource
//
//  Created by Justin Jia on 11/6/16.
//  Copyright © 2016 TintPoint. MIT license.
//

import XCTest
@testable import Resource

enum AppString: String {

    case test

}

extension AppString: StringDescribing {

    var content: String {
        return rawValue
    }

}

class StringResourceTests: XCTestCase {

    func testStringResource() {
        XCTAssertEqual(Resource.of(AppString.test), AppString.test.rawValue)
    }

}
