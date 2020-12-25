import XCTest

import clitoolTests

var tests = [XCTestCaseEntry]()
tests += clitoolTests.allTests()
XCTMain(tests)
