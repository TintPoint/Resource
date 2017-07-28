//
//  StoryboardResourceTests.swift
//  Tests
//
//  Created by Justin Jia on 11/14/16.
//  Copyright © 2016 TintPoint. MIT license.
//

import XCTest
@testable import Resource

enum AppStoryboard {

    case test

}

extension AppStoryboard: StoryboardDescribing {

    var name: String {
        return "Test"
    }

    var bundle: Bundle {
        return Bundle(for: StoryboardResourceTests.self)
    }

}

class StoryboardResourceTests: XCTestCase {

    func testStoryboardProtocolResource() {
        XCTAssertNotNil(Resource.of(AppStoryboard.test).instantiateInitialViewController())
    }

    func testStoryboardStructResource() {
        XCTAssertNotNil(Resource.of(StoryboardDescription(name: "Test", bundle: Bundle(for: StoryboardResourceTests.self))).instantiateInitialViewController())
    }

}
