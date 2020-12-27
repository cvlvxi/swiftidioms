import Foundation

/// Read text file line by line in efficient way
public class LineReader {
   public let path: String

   fileprivate let file: UnsafeMutablePointer<FILE>!

   init?(path: String) {
      self.path = path
      file = fopen(path, "r")
      guard file != nil else { return nil }
   }

   public var nextLine: String? {
      var line:UnsafeMutablePointer<CChar>? = nil
      var linecap:Int = 0
      defer { free(line) }
      return getline(&line, &linecap, file) > 0 ? String(cString: line!) : nil
   }

   deinit {
      fclose(file)
   }
}

extension LineReader: Sequence {
   public func  makeIterator() -> AnyIterator<String> {
      return AnyIterator<String> {
         return self.nextLine
      }
   }
}


public class TSV: Sequence, IteratorProtocol {

    public typealias DataMap = [String:String]
    public typealias Element = DataMap
    
    var lineReader: LineReader;
    var delim: Character
    var normalisedHeaders: [String] = []
    
    public init(filePath: String, delim: Character = "\t") {
        self.delim = delim
        self.lineReader = LineReader(path: filePath)!
        // Assume first line headers
        guard let headers = self.lineReader.nextLine else {
            fatalError("No header exists")
        }
        for header in headers.split(separator: self.delim).map({ $0.trimmingCharacters(in: .whitespacesAndNewlines) }) {
            normalisedHeaders.append(header)
        }
    }

    public func next() -> Element? {
        if let data = self.lineReader.nextLine {
            var dataMap: [String: String] = [:]
            for(idx, data) in data.split(separator: self.delim).map({ $0.trimmingCharacters(in: .whitespacesAndNewlines)}).enumerated() {
                let header = normalisedHeaders[idx]
                dataMap[header] = data
            }
            return dataMap
        } else {
            return nil;
        }
    }
    
}

