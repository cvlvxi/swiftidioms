import XCTest
import somelib
import class Foundation.Bundle

final class fsTests: XCTestCase {

    var manager: FileManager = FileManager.default

    override func setUp() {
        if manager.currentDirectoryPath.contains(".build") {
            manager.changeCurrentDirectoryPath("..")
        }
    }

    func checkDirectoryExists(path: String) {
        XCTAssertEqual(true, manager.fileExists(atPath: path))
    }

    /*
     29
     16 + 8 + 4 + 0 + 1
      11101  >> 00001
      11101 <<  00010

     */

    func testGzip() throws {
        let path = "data/mcap_small2.txt.gz"
        checkDirectoryExists(path: path)
        let fh = FileHandle(forReadingAtPath: path)!
        let some_data = fh.readData(ofLength: 100)
        for currByte in some_data {
            var bit_str = ""
            for i in stride(from: 7, to: -1, by: -1) {
                let res = ((currByte >> i) % 2)
                bit_str += String(res)
            }
            print(bit_str)
        }
    }



    func testDataIterator() throws {
        let path = "data/mcap.txt"
        checkDirectoryExists(path: path)
        let fh = FileHandle(forReadingAtPath: path)
        let diter = DataIterator(fh, bufferSize: 1000)
        XCTAssertNotNil(diter)
        let someData = diter.next()!
        XCTAssertNotNil(someData)
    }
    
    func testLineProcessor() throws {
        let path = "data/mcap_small.txt"
        checkDirectoryExists(path: path)
        let diter = DataIterator(FileHandle(forReadingAtPath: path), bufferSize: 100)
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
    
    func testLineProcessorGzipped() throws {
//        let path = "data/mcap_small2.txt.gz"
//        let lprocessor = LineProcessor(DataIterator(FileHandle(forReadingAtPath: path), bufferSize: 10, gzipped: true))
//        XCTAssertNotNil(lprocessor)
//        var expectedStr: String = "#grch37_chrom\tpos\tref\talt\tmcapv1.4\tmcap_sensitivityv1.4"
//        var someStr: String? = lprocessor.next()
//        XCTAssertEqual(someStr, expectedStr)
//        expectedStr = "chr1\t69091\tA\tT\t0.007082\t0.99308"
//        someStr = lprocessor.next()
//        XCTAssertEqual(someStr, expectedStr)
//        expectedStr = "chr1\t69091\tA\tG\t0.009964\t0.98538"
//        someStr = lprocessor.next()
//        XCTAssertEqual(someStr, expectedStr)
//        someStr = lprocessor.next()
//        XCTAssertEqual(someStr, nil)
        
    }

    static var allTests = [
        ("testDataIterator", testDataIterator),
        ("testLineProcessor", testLineProcessor),
        ("testLineProcessorGzipped", testLineProcessorGzipped),
    ]
}
