import Cocoa

// This is for asociated types
struct StackIterator<T>: IteratorProtocol {
    var stack: Stack<T>
    
    mutating func next() -> T? {
        return stack.pop()
    }
}

struct Stack<Element>: Sequence {
    var items = [Element]()
    
    mutating func push(_ newItem: Element) {
        items.append(newItem)
    }
    
    mutating func pop() -> Element? {
        guard !items.isEmpty else { return nil }
        return items.removeLast()
    }
    
    func map<U>(_ txform: (Element) -> U) -> Stack<U> {
        var mappedItems = [U]()
        for item in items {
            mappedItems.append(txform(item))
        }
        return Stack<U>(items: mappedItems)
    }
    
    func makeIterator() -> StackIterator<Element> {
        return StackIterator(stack: self)
    }
    
    mutating func pushAll<S: Sequence>(_ sequence: S) where S.Element == Element {
        for item in sequence {
            self.push(item)
        }
    }
    
    // Bronze Challenge Chapter 21
    func filter(_ close: (Element) -> Bool) -> Stack<Element> {
        var filteredItems = [Element]()
        for item in items {
            if close(item) {
                filteredItems.append(item)
            }
        }
        return Stack<Element>(items: filteredItems)
    }
}

var intStack = Stack<Int>()
intStack.push(1)
intStack.push(2)
var doubleStack = intStack.map { 2 * $0 }

print(String(describing: intStack.pop()))
print(String(describing: intStack.pop()))
print(String(describing: intStack.pop()))

print(String(describing: doubleStack.pop()))
print(String(describing: doubleStack.pop()))

var stringStack = Stack<String>()
stringStack.push("this is a string")
stringStack.push("another string")

print(String(describing: stringStack.pop()))

func myMap<T,U>(_ items: [T], _ txform: (T) -> (U)) -> [U] {
    var result = [U]()
    for item in items {
        result.append(txform(item))
    }
    return result
}

let strings = ["one", "two", "three"]
let stringLengths = myMap(strings) { $0.count }
print(stringLengths)

func checkIfEqual<T: Equatable>(_ first: T, _ second: T) -> Bool {
    return first == second
}

print(checkIfEqual(1, 1))
print(checkIfEqual("a string", "a string"))
print(checkIfEqual("a string", "a different string"))

func checkIfDescriptionsMatch<T: CustomStringConvertible, U: CustomStringConvertible>(_ first: T, _ second: U) -> Bool {
    return first.description == second.description
}

print()
print(checkIfDescriptionsMatch(Int(1), UInt(1)))
print(checkIfDescriptionsMatch(1, 1.0))
print(checkIfDescriptionsMatch(Float(1.0), Double(1.0)))


// Using asociated types
var myStack = Stack<Int>()
myStack.push(10)
myStack.push(20)
myStack.push(30)

var myStackIterator = StackIterator(stack: myStack)
while let value = myStackIterator.next() {
    print("got \(value)")
}

for value in myStack {
    print("for-in loop: got \(value)")
}

myStack.pushAll([1, 2, 3])
for value in myStack {
    print("after pushing: got \(value)")
}

var myOtherStack = Stack<Int>()
myOtherStack.pushAll([1, 2, 3])
myStack.pushAll(myOtherStack)
for value in myStack {
    print("after pushing items onto stack, got \(value)")
}


// Generic Composition adn Opague Types
protocol Food {
    var menuListing: String { get }
}

struct Bread: Food {
    var kind = "sourdough"
    var menuListing: String {
        "\(kind) bread"
    }
}

func eat<T: Food>(_ food: T) {
    print("I sure love \(food.menuListing).")
}

eat(Bread())

struct Restaurant {
    
    private struct SlicedFood<Ingredient: Food>: Food {
        var food: Ingredient
        var menuListing: String {
            "a slice of \(food.menuListing)"
        }
    }
    
    private struct CookedFood<Ingredient: Food>: Food {
        var food: Ingredient
        var menuListing: String {
            "\(food.menuListing), cooked to perfection"
        }
    }
    
    func makeSlicedBread() -> some Food {
        return SlicedFood(food: Bread())
    }
    
    func makeToast() -> some Food {
        let slicedBread = SlicedFood(food: Bread())
        return CookedFood(food: slicedBread)
    }
}

let restaurant = Restaurant()
let toast = restaurant.makeToast()
eat(toast)

// Silver Challenge Chapter 21
func findAll<T: Equatable>(_ items: [T], _ elem: T) -> [Int] {
    var returnArray = [Int]()
    var count = 0
    for item in items {
        if item == elem {
            returnArray.append(count)
        }
        count += 1
    }
    return returnArray
}

// Gold Challenge Chapter 21
//func findAllGold<T: Equatable, U: Collection>(_ items: U, _ elem: T) -> [Int] {
//    var returnArray = [Int]()
//    var count = 0
//    for item in U {
//        if item == elem {
//            returnArray.append(count)
//        }
//        count += 1
//    }
//    return returnArray
//}

var ex = [1, 2, 3, 2, 4, 2]
findAll(ex, 2)

/*
// There is an infinite loop somewhere above so this is not running yer
extension Stack where Element: Equatable {
    static func ==(lhs: Stack, rhs: Stack) -> Bool {
        return lhs.items == rhs.items
    }
}

let myTasks = Stack(items: ["Clean up"])
let yourTasks = Stack(items: ["Master Swift"])
print(myTasks == yourTasks)

class Pancake { }
let breakfast = Stack(items: [Pancake(), Pancake()])
let lunch = Stack(items: [Pancake()])
breakfast == lunch
*/
