//
//  ViewControllerResourceTests.swift
//  Tests
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
        return "Test"
    }

    var storyboard: UIStoryboard {
        return Resource.of(AppStoryboard.test)
    }

}

class CustomAppController: UIViewController, CustomViewController {

    static let representedBy: ViewControllerDescribing = AppViewController.test

}

class ViewControllerResourceTests: XCTestCase {

    func testViewControllerProtocolResource() {
        XCTAssertEqual(Resource.of(AppViewController.test).title, "Test")
    }

    func testViewControllerStructResource() {
        XCTAssertEqual(Resource.of(ViewControllerDescription(name: "Test", storyboard: Resource.of(AppStoryboard.test))).title, "Test")
    }

    func testViewControllerCustomResource() {
        let controller = Resource.of(CustomAppController.self)
        XCTAssert(controller as Any is CustomAppController)
        XCTAssertEqual(controller.title, "Test")
    }

}
