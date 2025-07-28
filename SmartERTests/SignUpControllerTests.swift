import XCTest
@testable import SmartER

final class SignUpControllerTests: XCTestCase {
    var controller: SignUpController!
    
    override func setUp() {
        super.setUp()
        controller = SignUpController()
    }
    
    override func tearDown() {
        controller = nil
        super.tearDown()
    }
    
    func testValidEmail() {
        XCTAssertTrue(controller.isValidEmail("test@example.com"))
        XCTAssertTrue(controller.isValidEmail("user123@mail.co"))
    }
    
    func testInvalidEmail() {
        XCTAssertFalse(controller.isValidEmail("testexample.com"))
        XCTAssertFalse(controller.isValidEmail("user@com"))
    }
    
    func testValidPassword() {
        XCTAssertTrue(controller.isValidPassword("123456"))
        XCTAssertTrue(controller.isValidPassword("StrongPass123"))
    }
    
    func testInvalidPassword() {
        XCTAssertFalse(controller.isValidPassword("123"))
    }
}
