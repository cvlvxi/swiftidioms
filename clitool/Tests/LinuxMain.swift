import XCTest

import clitoolTests
import tsvTests

var tests = [XCTestCaseEntry]()
tests += clitoolTests.allTests()
XCTMain(tests)
