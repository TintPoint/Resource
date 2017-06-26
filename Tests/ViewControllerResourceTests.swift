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
        return rawValue.capitalized
    }

    var storyboard: UIStoryboard {
        return Resource.of(AppStoryboard.test)
    }

}

class CustomAppController: UIViewController, CustomViewController {

    static let representedBy: ViewControllerDescribing = AppViewController.test

}

class ViewControllerResourceTests: XCTestCase {

    func testViewControllerResource() {
        XCTAssertEqual(Resource.of(AppViewController.test).title, AppViewController.test.name)
    }

    func testCustomViewControllerResource() {
        let controller = Resource.of(CustomAppController.self)
        XCTAssert(controller as Any is CustomAppController)
        XCTAssertEqual(controller.title, AppViewController.test.name)
    }

}
