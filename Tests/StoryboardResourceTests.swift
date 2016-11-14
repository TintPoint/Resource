//
//  StoryboardResourceTests.swift
//  Resource
//
//  Created by Justin Jia on 11/14/16.
//  Copyright © 2016 TintPoint. MIT license.
//

import XCTest
@testable import Resource

enum StoryboardDescription: String {

    case test

}

extension StoryboardDescription: StoryboardDescribing {

    var name: String {
        return rawValue.capitalized
    }

    var bundle: Bundle {
        return Bundle(for: StoryboardResourceTests.self)
    }

}

class StoryboardResourceTests: XCTestCase {

    func testStoryboardResource() {
        XCTAssertNotNil(Resource.of(StoryboardDescription.test).instantiateInitialViewController())
    }
    
}
