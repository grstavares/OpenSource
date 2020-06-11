import XCTest
@testable import FoundationExtensions

final class CapitalizedTests: XCTestCase {
    
    @Capitalized var string: String = "swift"
    
    func testCapitalized() {
        XCTAssert(string == "Swift")
        string = "SWIFT"
        XCTAssert(string == "Swift")
    }
    
    static var allTests = [
        ("testCapitalized", testCapitalized)
    ]
}
