import Cocoa

var str = "Hello, playground"

var dog: String? = nil


func something(_ dog: String!) {
    print(dog + "cat")
}

let gz_file = "/Users/Christopher/Desktop/dev/dev/swiftidioms4/clitool/data/mcap.txt"


//let bytes = fh?.readData(ofLength: 20)

//let some_str = String(decoding: bytes!, as: UTF8.self)

// Use the iterator pattern to process a line

class DataIterator : Sequence, IteratorProtocol {
    let fh: FileHandle
    var bufferSize: Int
    init(_ fh: FileHandle!, bufferSize: Int) {
        self.fh = fh
        self.bufferSize = bufferSize
        
    }
    
    func next() -> Data? {
        // How can I tell when this is end?
        let data = self.fh.readData(ofLength: self.bufferSize)
        // Check if 0 bytes
        if data.count  == 0 {
            return nil
        }
        return data
    }
    typealias Element = Data // Swift Data
}

//let a = DataIterator(fh!)

class LineProcessor : Sequence, IteratorProtocol {

    typealias Element = String
    let dataIterator: DataIterator
    let delim: Character = "\n"
    var remainingData: Data? = nil
    init(_ dataIterator: DataIterator) {
        self.dataIterator = dataIterator
    }
    
    func nextElement(dataElement: Data) -> String? {
        for (idx, byte) in dataElement.enumerated() {
            let d = Data(repeating: byte, count: 1)
            let c = String(decoding: d, as: UTF8.self)
            if c[c.startIndex] == delim {
                // Don't include the new line
                let currData = dataElement[0..<idx]
                // Set last string from past the new line to end
                self.remainingData = dataElement[(idx+1)...]
                return String(decoding: currData, as: UTF8.self)
            }
        }
    }
    
    func next() -> String? {
        // only iterate over the dataIterator if lastString is nil
        
        
        
        // Iterate over the given "Data" with buffer size set
        for dataElement in self.dataIterator {
            let returnData: Data
            for (idx, byte) in dataElement.enumerated() {
                let d = Data(repeating: byte, count: 1)
                let c = String(decoding: d, as: UTF8.self)
                if c[c.startIndex] == delim {
                    // Don't include the new line
                    returnData = dataElement[0..<idx]
                    // Set last string from past the new line to end
                    self.lastString =
                    return String(decoding: returnData, as: UTF8.self)
                }
            }
            
        }
        return nil
    }
}



let fh = FileHandle(forReadingAtPath: gz_file)
let diterator = DataIterator(fh, bufferSize: 1)
let lineprocessor = LineProcessor(diterator)

for i in lineprocessor {
    print(i)
}


//
//for c in catdog {
//    let bleh = Data(repeating: c, count: 1)
//    let data = String(decoding: bleh, as: UTF8.self)
//    print(data)
//
//}
////
////String(
//
//let dog3: ArraySlice<Data> = catdog[0..<10]
//
//withUnsafePointer(to: dog3[0]) {
//    print(" value has address: \($0)")
//}
//
//withUnsafePointer(to: catdog[0]) {
//    print(" value has address: \($0)")
//}

