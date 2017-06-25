//
//  LocalizedStringResourceTests.swift
//  Tests
//
//  Created by Justin Jia on 11/6/16.
//  Copyright © 2016 TintPoint. MIT license.
//

import XCTest
@testable import Resource

enum AppLocalizedString {

    case test(argument: String?)

}

extension AppLocalizedString: LocalizedStringDescribing {

    var key: String {
        switch self {
        case .test(let argument) where argument != nil: return "With Argument %@"
        case .test: return "No Argument"
        }
    }

    var comments: String {
        switch self {
        case .test: return "Comment"
        }
    }

    var arguments: [Any]? {
        switch self {
        case .test(let argument) where argument != nil: return [argument!]
        case .test: return nil
        }
    }

}

class LocalizedStringResourceTests: XCTestCase {

    func testLocalizedStringResource() {
        XCTAssertEqual(Resource.of(AppLocalizedString.test(argument: "A")), "With Argument A")
        XCTAssertEqual(Resource.of(AppLocalizedString.test(argument: nil)), "No Argument")
    }

}
