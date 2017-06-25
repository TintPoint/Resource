//
//  StoryboardResourceTests.swift
//  Tests
//
//  Created by Justin Jia on 11/14/16.
//  Copyright © 2016 TintPoint. MIT license.
//

import XCTest
@testable import Resource

enum AppStoryboard: String {

    case test

}

extension AppStoryboard: StoryboardDescribing {

    var name: String {
        return rawValue.capitalized
    }

    var bundle: Bundle {
        return Bundle(for: StoryboardResourceTests.self)
    }

}

class StoryboardResourceTests: XCTestCase {

    func testStoryboardResource() {
        XCTAssertNotNil(Resource.of(AppStoryboard.test).instantiateInitialViewController())
    }
    
}
