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

