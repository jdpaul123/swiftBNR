import Cocoa

struct Stack<Element> {
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
