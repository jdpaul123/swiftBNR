// Chapter 13: Closures
import Cocoa

let volunteerCounts = [1, 3, 40, 32, 2, 53, 77, 13]

/* This is a named closure but we are using an inline one below that does the same thing
func isAsending(_ i: Int, _ j: Int) -> Bool {
    return i < j
}
*/

/* This is a slimmed down version of the above way, but we slim it down even more below
let volunteersSorted = volunteerCounts.sorted(by: {
    (i: Int, j: Int) -> Bool in
    return i < j
})
 */

// using inline syntax
//let volunteersSorted = volunteerCounts.sorted(by: {i, j in i < j})

// using positional variable names:
//let volunteersSorted = volunteerCounts.sorted(by: {$0 < $1})

// You can use trailing closure syntax where you can put the closure after the parens if it is
// the last argument in the list of arguments. In this case, there is only one argument, that is
// the closure so you can omit the parens altogether
let volunteersSorted = volunteerCounts.sorted { $0 < $1 }
print(volunteersSorted)


func format(numbers: [Double], using formatter: (Double) -> String = {"\($0)"}) -> [String] {
    var result = [String]()
    for number in numbers {
        let transformed = formatter(number)
        result.append(transformed)
    }
    return result
}

var numberOfTransformations = 0

let rounder: (Double) -> String = {
    (num: Double) -> String in
    numberOfTransformations += 1
    return "\(Int(num.rounded()))"
}
let volunteerAverages = [10.75, 4.2, 1.5, 12.12, 16.815]
let roundedAverageAsStrings = format(numbers: volunteerAverages, using: rounder)
let exactAverageAsStrings = format(numbers: volunteerAverages)
print(numberOfTransformations)

// map(_:)
let roundedAverages = volunteerAverages.map {
    (avg: Double) -> Int in
    return Int(avg.rounded())
}

// filter(_:)
let passingAverages = roundedAverages.filter {
    (avg: Int) -> Bool in
    return avg >= 10
}

// reduce(_:_:)
let estimatedParticipation = passingAverages.reduce(5) {
    (estimationSoFar: Int, currentOrgAverage: Int) -> Int in
    return estimationSoFar + currentOrgAverage
}

// Functions as Return Types: This is not used much becasue it is a little over-engineered and these functions
// can usually be refactored into one function real easily
func makeCharacterRemover(for character: Character) -> (String) -> String {
    func removeFrom(_ input: String) -> String {
        return input.filter { $0 != character}
    }
    return removeFrom
}

let removeLowerCaseLs = makeCharacterRemover(for: "l")
let strangeGreeting = removeLowerCaseLs("Hello World")

let removeLowerCaseOs = makeCharacterRemover(for: "o")
let strangerGreeting = removeLowerCaseOs(strangeGreeting)
