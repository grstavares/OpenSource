import XCTest

#if !canImport(ObjectiveC)
public func allTests() -> [XCTestCaseEntry] {
    return [
        /// Property Wrappers
        testCase(CodableTests.allTests),
        testCase(ConstrainedTests.allTests),
        testCase(FormattedTests.allTests),
        testCase(TrimmedTests.allTests),
        testCase(UnitIntervalTests.allTests),
        testCase(UppercasedTests.allTests),
        testCase(LowercasedTests.allTests),
        testCase(CapitalizedTests.allTests),
        /// Version
        testCase(VersionTests.allTests),
    ]
}
#endif
