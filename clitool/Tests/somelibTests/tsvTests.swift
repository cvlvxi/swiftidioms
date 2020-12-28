//import XCTest
//import somelib
//import Compression
//import class Foundation.Bundle
//
//final class tsvTests: XCTestCase {
//    func testTSV() throws {
//        // Check tsv exists
//        let tsvDataPath = "data/mcap.txt"
//        let fm = FileManager.default
//        XCTAssertEqual(true, fm.fileExists(atPath: tsvDataPath))
//        
//        let t = TSV(filePath: tsvDataPath)
//        XCTAssertEqual (t.next()!.count > 0, true)
//
//    }
//    
//    func testGzippedTSVRaw() throws {
//        let gzippedTsvDataPath = "data/mcap2.txt.gz"
//
//        let fptr = fopen(gzippedTsvDataPath, "r")!
//        var lineptr: UnsafeMutablePointer<CChar>? = nil
//        var lineCap: Int = 0
//        let bytesRead = getline(&lineptr, &lineCap, fptr)
//        let data: Data = Data(bytes: lineptr!, count: bytesRead)
//        let someStr = String(decoding: try! data.gunzipped(), as: UTF8.self)
//        XCTAssertNotNil(someStr)
//        fclose(fptr)
//    }
//    
//    func testGzippedTSV() throws {
//    }
//
//    static var allTests = [
//        ("testTSV", testTSV),
//        ("testGzippedTSVRaw", testGzippedTSVRaw),
//        ("testGzippedTSV", testGzippedTSV),
//    ]
//}
