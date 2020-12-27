import XCTest

import somelibTests

var tests = [XCTestCaseEntry]()
tests += somelibTests.allTests()
XCTMain(tests)
