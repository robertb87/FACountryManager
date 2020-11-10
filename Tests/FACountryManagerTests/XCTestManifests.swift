import XCTest

#if !canImport(ObjectiveC)
public func allTests() -> [XCTestCaseEntry] {
    return [
        testCase(FACountryManagerTests.allTests),
    ]
}
#endif
