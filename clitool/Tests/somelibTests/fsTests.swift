import XCTest
import somelib
import class Foundation.Bundle

final class fsTests: XCTestCase {
    func testDataIterator() throws {
        let path = "data/mcap.txt"
        let fm = FileManager.default
        // Check tsv exists
        XCTAssertEqual(true, fm.fileExists(atPath: path))
        let fh = FileHandle(forReadingAtPath: path)
        let diter = DataIterator(fh, bufferSize: 1000)
        XCTAssertNotNil(diter)
        let someData = diter.next()!
        XCTAssertNotNil(someData)
    }
    
    func testLineProcessor() throws {
        let path = "data/mcap_small.txt"
        let diter = DataIterator(FileHandle(forReadingAtPath: path), bufferSize: 10)
        var expectedStr: String = "#grch37_chrom\tpos\tref\talt\tmcapv1.4\tmcap_sensitivityv1.4"
        let lprocessor = LineProcessor(diter)
        XCTAssertNotNil(lprocessor)
        var someStr: String? = lprocessor.next()
        XCTAssertEqual(someStr, expectedStr)
        expectedStr = "chr1\t69091\tA\tT\t0.007082\t0.99308"
        someStr = lprocessor.next()
        XCTAssertEqual(someStr, expectedStr)
        expectedStr = "chr1\t69091\tA\tG\t0.009964\t0.98538"
        someStr = lprocessor.next()
        XCTAssertEqual(someStr, expectedStr)
        someStr = lprocessor.next()
        XCTAssertEqual(someStr, nil)
    }

    static var allTests = [
        ("testDataIterator", testDataIterator),
        ("testLineProcessor", testLineProcessor),
    ]
}
