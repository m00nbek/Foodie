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
    func test_validate_email() throws {
        XCTAssertTrue(validation.validate(.email, for: "some@idk.com"))
        XCTAssertFalse(validation.validate(.email, for: "wrongemail"))
    }
    func test_validate_username() throws {
        XCTAssertTrue(validation.validate(.username, for: "m00nbek"))
        XCTAssertFalse(validation.validate(.username, for: "m0"))
        XCTAssertFalse(validation.validate(.username, for: "reallylonglongusername"))
    }
    func test_validate_password() throws {
        XCTAssertTrue(validation.validate(.password, for: "password"))
        XCTAssertFalse(validation.validate(.password, for: "m0 n"))
        XCTAssertFalse(validation.validate(.password, for: "reallylonglongpassword"))
    }
    func test_validate_fullName() throws {
        XCTAssertTrue(validation.validate(.fullName, for: "John Doe"))
        XCTAssertFalse(validation.validate(.fullName, for: "Jo"))
        XCTAssertFalse(validation.validate(.fullName, for: "blablablablablablablabla"))
    }
    func test_validate_address() throws {
        XCTAssertTrue(validation.validate(.address, for: "Tashkent, Uzbekistan"))
        XCTAssertFalse(validation.validate(.address, for: "Tash"))
        XCTAssertFalse(validation.validate(.address, for: "Really long long long adddresss blablablablaablablablalba"))
    }
}
