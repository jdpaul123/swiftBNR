import Cocoa

struct Point {
    let x: Int
    let y: Int
    let label: String? = nil
}

extension Point: Comparable, Hashable {
    static func ==(lhs: Point, rhs: Point) -> Bool {
        return (lhs.x == rhs.x) && (lhs.y == rhs.y)
    }
    
    // Platinum Challenge Chapter 25: making the comparisons adhere to Euclidean distance
    static func <(lhs: Point, rhs: Point) -> Bool {
        let distLhs = (pow(Double(lhs.x), 2) + pow(Double(lhs.y), 2)).squareRoot()
        let distRhs = (pow(Double(rhs.x), 2) + pow(Double(rhs.y), 2)).squareRoot()
        return distLhs < distRhs
    }
    
    // Bronze Challenge Chapter 25
    static func +(lhs: Point, rhs: Point) -> Point {
        return Point(x: lhs.x + rhs.x, y: lhs.y + rhs.y)
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(x)
        hasher.combine(y)
    }
}

let a = Point(x: 3, y: 4)
let b = Point(x: 3, y: 4)
let abEqual = (a == b)
let abNotEqual = (a != b)


let c = Point(x: 2, y: 6)
let d = Point(x: 3, y: 7)
let cdEqual = (c == d)
let cLessThanD = (c < d)

let cLessThanEqualD = (c <= d)
let cGreaterThanD = (c > d)
let cGreaterThanEqualD = (c >= d)

let pointRange = c..<d
pointRange.contains(a)
pointRange.contains(Point(x: -1, y: -1))
pointRange.contains(c)
pointRange.contains(d)

let points: Set = [a, b, c]
points.intersection([b, c, d])

let pointNames: [Point:String] = [
    Point(x: 0, y: 0): "origin",
    a: "a",
]

// Testing ch 25 bronze challenge
let e = Point(x: 5, y: 5)
let f = Point(x: 10, y: 11)
let g = e + f
print(g)

// Gold Challenge Chapter 25: Everything below pertaining to the Person class
class Person {
    var name: String
    var age: Int
    init() {
        self.name = "John Smith"
        self.age = 35
    }
    
    init(name: String, age: Int) {
        self.name = name
        self.age = age
    }
}

extension Person: Equatable {
    static func ==(lhs: Person, rhs: Person) -> Bool {
        return (lhs.age == rhs.age) && (lhs.name == rhs.name)
    }
}

let p1 = Person()
let p2 = Person()
var people = [Person]()
people.append(p1)
people.append(p2)
people.firstIndex(of: p1)


// Below is for Chapter 25 Platinum Challenge
let i = Point(x: 3, y: 4)
let j = Point(x: 2, y: 5)
let iGreaterThanJ = (i > j)
let iLessThanJ = (i < j)
