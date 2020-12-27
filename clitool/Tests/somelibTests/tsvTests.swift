import XCTest
import somelib
import class Foundation.Bundle

final class tsvTests: XCTestCase {
    func testTSV() throws {
        // Check tsv exists
        let tsvDataPath = "data/mcap.txt"
        let fm = FileManager.default
        XCTAssertEqual(true, fm.fileExists(atPath: tsvDataPath))
        
        let t = TSV(filePath: tsvDataPath)
        XCTAssertEqual (t.next()!.count > 0, true)

    }

    static var allTests = [
        ("testTSV", testTSV),
    ]
}
