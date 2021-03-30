//
//  main.swift
//  wordlasso
//
//  Created by Jonathan Paul on 3/28/21.
//

import Foundation

struct Wordlasso {
    func run() throws {
        let path = "/usr/share/dict/words"
        let wordFinder = try WordFinder(wordListPath: path, ignoreCase: true)
        
        let args = CommandLine.arguments
        print("Command-line arguments: \(args)")
        
        if args.count > 1 {
            let template = args[1]
            findAndPrintMatches(for: template, using: wordFinder)
        } else {
            while true {
                print("Enter word template: ", terminator: "")
                let template = readLine() ?? ""
                if template.isEmpty { return }
                findAndPrintMatches(for: template, using: wordFinder)
            }
        }
    }
    
    private func findAndPrintMatches(for template: String, using wordFinder: WordFinder) {
        let matches = wordFinder.findMatches(for: template)
        print("Found \(matches.count) \(matches.count == 1 ? "match" : "matches"):")
        for match in matches {
            print(match)
        }
    }
}

do {
    try Wordlasso().run()
} catch {
    fatalError("Program exited unexpectedly. \(error)")
}
