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
    func test_is_valid_username() throws {
        XCTAssertTrue(validation.validate(.username, for: "m00nbek"))
    }
    func test_is_not_valid_username() throws {
        XCTAssertFalse(validation.validate(.email, for: "m0"))
    }
    func test_is_valid_password() throws {
        XCTAssertTrue(validation.validate(.password, for: "password"))
    }
    func test_is_not_valid_password() throws {
        XCTAssertFalse(validation.validate(.email, for: "m0 n"))
    }
}
