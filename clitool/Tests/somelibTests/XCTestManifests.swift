import XCTest

#if !canImport(ObjectiveC)
public func allTests() -> [XCTestCaseEntry] {
    return [
//        testCase(tsvTests.allTests),
        testCase(fsTests.allTests)
    ]
}
#endif
