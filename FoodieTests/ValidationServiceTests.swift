//
//  ValidationServiceTests.swift
//  ValidationServiceTests
//
//  Created by Oybek on 8/22/21.
//

import XCTest
@testable import Foodie

class ValidationServiceTests: XCTestCase {

    var validation: ValidationService!
    override func setUp() {
        super.setUp()
        validation = ValidationService()
    }
    override func tearDown() {
        super.tearDown()
        validation = nil
    }
    func test_is_valid_email() throws {
        XCTAssertTrue(validation.validate(.email, for: "some@idk.com"))
    }
    func test_is_not_valid_email() throws {
        XCTAssertFalse(validation.validate(.email, for: "wrongemail"))
    }
}
