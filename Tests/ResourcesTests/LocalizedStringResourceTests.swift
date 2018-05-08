//
//  LocalizedStringResourceTests.swift
//  Tests
//
//  Created by Justin Jia on 11/6/16.
//  Copyright © 2016 TintPoint. MIT license.
//

@testable import Resource
import XCTest

enum AppLocalizedString {
    case test(argument: String?)
}

extension AppLocalizedString: LocalizedStringDescribing {
    var key: String {
        switch self {
        case .test(_?): return "With Argument %@"
        case .test: return "No Argument"
        }
    }

    var comment: String {
        switch self {
        case .test: return "Comment"
        }
    }

    var arguments: [Any]? {
        switch self {
        case let .test(argument?): return [argument]
        case .test: return nil
        }
    }
}

class LocalizedStringResourceTests: XCTestCase {
    func testLocalizedStringProtocolResource() {
        XCTAssertEqual(Resource.of(AppLocalizedString.test(argument: "A")), "With Argument A")
        XCTAssertEqual(Resource.of(AppLocalizedString.test(argument: nil)), "No Argument")
    }

    func testLocalizedStringStructResource() {
        XCTAssertEqual(Resource.of(LocalizedStringDescription(key: "Key %@", comment: "Comment", arguments: ["X"])), "Key X")
        XCTAssertEqual(Resource.of(LocalizedStringDescription(key: "Key", comment: "Comment", arguments: nil)), "Key")
    }
}
