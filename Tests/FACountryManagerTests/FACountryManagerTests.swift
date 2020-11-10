import XCTest
@testable import FACountryManager

final class FACountryManagerTests: XCTestCase {
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct
        // results.
        XCTAssertEqual(FACountryManager().text, "Hello, World!")
    }

    static var allTests = [
        ("testExample", testExample),
    ]
}
