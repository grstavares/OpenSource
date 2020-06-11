import XCTest
@testable import FoundationExtensions

final class UppercasedTests: XCTestCase {
    
    @Uppercased var string: String = "swift"
    
    func testUppercased() {
        XCTAssert(string == "SWIFT")
        string = "Swift"
        XCTAssert(string == "SWIFT")
    }

    static var allTests = [
        ("testUppercased", testUppercased)
    ]
}
