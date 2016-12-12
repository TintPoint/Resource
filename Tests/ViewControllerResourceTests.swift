//
//  ViewControllerResourceTests.swift
//  Resource
//
//  Created by Justin Jia on 11/14/16.
//  Copyright © 2016 TintPoint. MIT license.
//

import XCTest
@testable import Resource

enum AppViewController: String {

    case test

}

extension AppViewController: ViewControllerDescribing {

    var name: String {
        return rawValue.capitalized
    }

    var storyboard: UIStoryboard {
        return Resource.of(AppStoryboard.test)
    }

}

class ViewControllerResourceTests: XCTestCase {

    func testViewControllerResource() {
        XCTAssertEqual(Resource.of(AppViewController.test).title, "Test")
    }

}
