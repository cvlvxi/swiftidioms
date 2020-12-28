import ArgumentParser
import somelib

struct Parser: ParsableCommand {

    @Argument(help: "File to parse")
    var filepath: String

    mutating func run() throws {
//        let tsv = TSV(filePath: filepath)

    }
}

Parser.main()
