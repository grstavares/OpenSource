import XCTest
@testable import FoundationExtensions

final class FormattedTests: XCTestCase {
    
    @Formatted({ $0.capitalized }) var firstName: String = "john"
    
    func testFormatted() {
        XCTAssert(firstName == "John")
    }

    static var allTests = [
        ("testFormatted", testFormatted)
    ]
}
