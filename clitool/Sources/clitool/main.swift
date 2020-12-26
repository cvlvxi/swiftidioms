import ArgumentParser

struct Parser: ParsableCommand {

    @Argument(help: "File to parse")
    var filepath: String

    mutating func run() throws {
        let tsv = TSV(filePath: filepath)
        print(tsv.next()!);
        print(tsv.next()!);
        print(tsv.next()!);
        print(tsv.next()!);
        
    }
}

Parser.main()
