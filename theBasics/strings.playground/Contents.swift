import Cocoa

let playground = "\u{0068}\u{0065}\u{006C}\u{006C}\u{006F}, playground"
var mutablePlayground = "Hello, mutable playground"
mutablePlayground += "!"
let quote = "I wanted to \"say\":\n\(playground)"
let quote2 = #"I wanted to \"say\":\n\(playground)"#
print(quote)
print(quote2)
for c: Character in mutablePlayground {
    print("'\(c)'")
}

// print out these unicode characters in the results bar to the right
let snowman = "\u{2603}"
let aAcute = "\u{0061}\u{0301}"

// the for-in loop below prints the unicode that represents waht is saved int the "playground" variable (ie. "Hello, playground")
for scalar in playground.unicodeScalars {
    print("\(scalar.value)")
}

// Some common characters, like the acute a, also have their own code
let aAcutePrecomposed = "\u{00E1}"
let b = (aAcute == aAcutePrecomposed) // this is an example of canonical equivalence
aAcute.count
aAcutePrecomposed.count

let start = playground.startIndex
let end = playground.index(start, offsetBy: 4)
let fifthCharacter = playground[end]
let range = ..<end
let range2 = ...end
let firstFive = playground[range2]
let firstFour = playground[range]

let empty = ""
let startE = empty.startIndex
let endE = empty.endIndex
if startE == endE {
    print("Empty String")
}
