import ArgumentParser

struct Parser: ParsableCommand {

    @Argument(help: "File to parse")
    var filepath: String

    mutating func run() throws {
       var tsv = TSV(filePath: filepath)
        
    }
}

Parser.main()
