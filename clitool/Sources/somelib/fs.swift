import Foundation

public class DataIterator : Sequence, IteratorProtocol {
    let fh: FileHandle
    var bufferSize: Int
    let gzipped: Bool
    public init(_ fh: FileHandle!, bufferSize: Int, gzipped: Bool = false) {
        self.fh = fh
        self.bufferSize = bufferSize
        self.gzipped = gzipped
    }
    
    public func next() -> Data? {
        // How can I tell when this is end?
        let data = self.fh.readData(ofLength: self.bufferSize)
        // Check if 0 bytes
        if data.count  == 0 {
            return nil
        }
        if self.gzipped {
//            return try! data.gunzipped()
            return nil

        } else {
            return data
        }
    }
    public typealias Element = Data // Swift Data
}


public class LineProcessor : Sequence, IteratorProtocol {

    public typealias Element = String
    let dataIterator: DataIterator
    let delim: Character = "\n"
    var remainingData: Data? = nil
    public init(_ dataIterator: DataIterator) {
        self.dataIterator = dataIterator
    }
    
    public func next() -> String? {
        // When do we return data?
        // When we hit a delimiter OR when the file has finished
        var appendedStr: String? = nil
        while true {
            var currData: Data? = nil
            if self.remainingData == nil {
                // Get the next data from the file
                currData = dataIterator.next()
                if currData == nil {
                    // At the end of the file
                    return appendedStr
                }
            } else {
                currData = self.remainingData
                self.remainingData = nil
            }
            for (idx, byte) in currData!.enumerated() {
                let d = Data(repeating: byte, count: 1)
                let c = String(decoding: d, as: UTF8.self)
                if c[c.startIndex] == delim {
                    // Don't include the new line
                    let foundDataSection = currData![0..<idx]
                    // Set last string from past the new line to end
                    self.remainingData = currData![(idx+1)...]
                    return (appendedStr ?? "") + String(decoding: foundDataSection, as: UTF8.self)
                }
            }
            appendedStr = (appendedStr ?? "") + String(decoding: currData!, as: UTF8.self)
        }
    }
}

