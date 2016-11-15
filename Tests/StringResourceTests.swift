//
//  StringResourceTests.swift
//  Resource
//
//  Created by Justin Jia on 11/6/16.
//  Copyright © 2016 TintPoint. MIT license.
//

import XCTest
@testable import Resource

enum StringDescription: String {

    case test

}

extension StringDescription: StringDescribing {

    var content: String {
        return rawValue
    }

}

class StringResourceTests: XCTestCase {

    func testStringResource() {
        XCTAssertEqual(Resource.of(StringDescription.test), StringDescription.test.rawValue)
    }

}
