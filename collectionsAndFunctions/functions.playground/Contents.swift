// chapter 12 Functions
import Cocoa

func printGreeting() {
    print("Hello, playground")
}
printGreeting()

func printPersonalGreeting(to name: String) {
    print("Hello \(name). Welcome to your playground.")
}
printPersonalGreeting(to: "JD")

func divisionDescriptionFor(numerator: Double, denominator: Double,
                            withPunctuation punctuation: String = ".") -> String{
    return "\(numerator) divided by \(denominator) is \(numerator / denominator)\(punctuation)"
}
print(divisionDescriptionFor(numerator: 9, denominator: 3))
print(divisionDescriptionFor(numerator: 9, denominator: 3, withPunctuation: "!"))

// In-out parameters: modifying an argument in pmace
var error = "The request failed."
func appendErrorCode(_ code: Int, toErrorString errorString: inout String) {
    if code == 400 {
        errorString += " bad request."
    }
}
appendErrorCode(400, toErrorString: &error)
print(error)

func areaOfTriabgleWith(base: Double, height: Double) -> Double {
    let rectangle = base * height
    func divide() -> Double {
        return rectangle / 2
    }
    return divide()
}
print(areaOfTriabgleWith(base: 3.0, height: 5.0))

// Multiple returns
func sortedEvenOddNumbers(_ numbers: [Int]) -> (evens: [Int], odds: [Int]) {
    var evens = [Int]()
    var odds = [Int]()
    for number in numbers {
        if number % 2 == 0 {
            evens.append(number)
        } else {
            odds.append(number)
        }
    }
    return (evens, odds)
}

let aBunchOfNumbers = [10, 1, 4, 3, 57, 43, 84, 27, 156, 111]
let theSortedNumbers = sortedEvenOddNumbers(aBunchOfNumbers)
print("The even numbers are: \(theSortedNumbers.evens); the odd numbers are: \(theSortedNumbers.odds)")

// Returning an optional type
func grabMiddleName(fromFullName name: (String, String?, String)) -> String? {
    return name.1
}

let middleName = grabMiddleName(fromFullName: ("Alice", nil, "Ward"))
let middleName2 = grabMiddleName(fromFullName: ("Jonathan", "Daniel", "Paul"))
if let theName = middleName {
    print(theName)
}
if let theName = middleName2 {
    print(theName)
}

// Exiting early from a function
func greetByMiddleName(fromFullName name: (first: String, middle: String?, last: String)) {
    guard let middleName = name.middle else {
        print("Hey there!")
        return
    }
    if name.middle!.count > 10 {
        // Below is the Bronze Challenge along with line 87 for chapter 12
        print("Hey, \(name.first) \(middleName.first!). \(name.last)")
    } else {
        print("Hey, \(middleName)")
    }
}
greetByMiddleName(fromFullName: ("Alice", nil, "Ward"))
greetByMiddleName(fromFullName: ("Jonathan", "Daniel", "Paul"))
greetByMiddleName(fromFullName: ("Jonathan", "Danielllllll", "Paul"))

// Silver challenge chapter 12
func siftBeans(fromGroceryList groceries: [String]) -> (beans: [String], notBeans: [String]) {
    var beans = [String]()
    var notBeans = [String]()
    for item in groceries {
        if item.hasSuffix("beans") {
            beans.append(item)
        } else {
            notBeans.append(item)
        }
    }
    return (beans, notBeans)
}

let result = siftBeans(fromGroceryList: ["green beans", "milk", "black beans", "pinto beans", "apples"])
result.beans == ["green beans", "black beans", "pinto beans"] // true
result.notBeans == ["milk", "apples"] // true
