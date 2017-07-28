//
//  ViewControllerResourceTests.swift
//  Tests
//
//  Created by Justin Jia on 11/14/16.
//  Copyright © 2016 TintPoint. MIT license.
//

import XCTest
@testable import Resource

enum AppViewController {

    case test, data

}

extension AppViewController: ViewControllerDescribing {

    var name: String {
        switch self {
        case .test: return "Test"
        case .data: return "Data"
        }
    }

    var storyboard: UIStoryboard {
        return Resource.of(AppStoryboard.test)
    }

}

class CustomAppController: UIViewController, CustomViewController {

    static let representedBy: ViewControllerDescribing = AppViewController.test

}

class DataReceivingAppController: UIViewController, DataReceivingController {

    static let representedBy: ViewControllerDescribing = AppViewController.data
    var controllerData: (String, Int)?

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

    func testViewControllerTransferResource() {
        let data = ("Text", 10)
        let controller = Resource.of(DataReceivingAppController.self, passing: data)
        XCTAssert(controller as Any is DataReceivingAppController)
        XCTAssertEqual(controller.title, "Data")
        XCTAssertEqual(controller.controllerData?.0, data.0)
        XCTAssertEqual(controller.controllerData?.1, data.1)
    }

}
