import Cocoa

enum TextAlignment: Int {
    case left       = 20
    case right      = 30
    case center     = 40
    case justify    = 50
}

var alignment = TextAlignment.justify

TextAlignment.left.rawValue
TextAlignment.right.rawValue
TextAlignment.center.rawValue
TextAlignment.justify.rawValue
alignment.rawValue

// Create a raw value
let myRawValue = 20

// Try to convert the raw value into a Text Alignment
// TextAlignment(rawValue: ) returns TextAlignment? so we use optional binding to determin nil or TextAlignment value back
if let myAlignment = TextAlignment(rawValue: myRawValue) {
    // Conversion succeeded!
    print("successfully created \(myAlignment) from \(myRawValue)")
} else {
    // Conversion failed
    print("\(myRawValue) has no corresponding TextAlignment case")
}

// no default should be used as the compiler knows that all cases can be exhausted through cases
switch alignment {
case .left:
    print("left aligned")
    
case .right:
    print("right aligned")

case .center:
    print("center aligned")
    
case .justify:
    print("justified")
}


// The rawValue will default to the case name if no value is given for String enums
// Chapter 19 Electrum Challenge using Caseiterable below down to line 59
enum ProgrammingLanguage: String, CaseIterable {
    case swift
    case objectiveC     = "objective-c"
    case c
    case cpp            = "c++"
    case java
}
print("There are \(ProgrammingLanguage.allCases.count) languages")
let caseList = ProgrammingLanguage.allCases.map({ "\"\($0)\"" }).joined(separator: ", ")
print("[\(caseList)]")

let myFavoriteLanguage = ProgrammingLanguage.swift
print("My favorite programming language is \(myFavoriteLanguage.rawValue)")


enum LightBulb {
    case on
    case off

    func surfaceTemperature(forAmbientTemperature ambient: Double) -> Double {
        switch self {
        case .on:
            return ambient + 150.0
            
        case .off:
            return ambient
        }
    }
    
    mutating func toggle() {
        switch self {
        case .on:
            self = .off
        
        case .off:
            self = .on
        }
    }
}

var bulb = LightBulb.on
let ambientTempurature = 77.0

var bulbTemperature = bulb.surfaceTemperature(forAmbientTemperature: ambientTempurature)
print("the bulb's temperature is \(bulbTemperature)")

bulb.toggle()
bulbTemperature = bulb.surfaceTemperature(forAmbientTemperature: ambientTempurature)
print("the bulb's temperature is \(bulbTemperature)")

enum ShapeDimensions {
    // point has no associated value - it is dimensionless
    case point
    
    // square's associated value is the length of one side
    case square(side: Double)
    
    // rectangle's associated value defines its width and height
    case rectangle(width: Double, height: Double)
    
    // Silver Challenge
    case triangle(base: Double, height: Double, side1: Double, side2: Double)
    
    func area() -> Double {
        switch self {
        case .point:
            return 0
        
        case let .square(side: side):
            return side * side
            
        case let .rectangle(width: w, height: h):
            return w * h
            
        case let .triangle(base: b, height: h, side1: _, side2: _):
            return b * h * 0.5
        }
    }
    
    // Bronze Challenge
    func perimeter() -> Double {
        switch self {
        case .point:
            return 0
        
        case let .square(side: s):
            return s * 4
        
        case let .rectangle(width: w, height: h):
            return w + w + h + h
        
        case let .triangle(base: b, height: _, side1: s1, side2: s2):
            return b + s1 + s2
        }
    }
}

var squareShape = ShapeDimensions.square(side: 10.0)
var rectShape = ShapeDimensions.rectangle(width: 5.0, height: 10.0)
var pointShape = ShapeDimensions.point
var traingleShape = ShapeDimensions.triangle(base: 5.0, height: 10.0, side1: 5, side2: 5)

print()
print("Squares area = \(squareShape.area())")
print("Rectangles area = \(rectShape.area())")
print("Point's area = \(pointShape.area())")
print("Triangles's area = \(traingleShape.area())")
print()
print("Squares perimeter = \(squareShape.perimeter())")
print("Rectangles perimeter = \(rectShape.perimeter())")
print("Point's perimeter = \(pointShape.perimeter())")
print("Triangles's perimeter = \(traingleShape.perimeter())")
