import ArgumentParser

struct Parser: ParsableCommand {

    @Argument(help: "File to parse")
    var filepath: String

    mutating func run() throws {
       readFile(filepath: filepath) 
    }
}

Parser.main()
