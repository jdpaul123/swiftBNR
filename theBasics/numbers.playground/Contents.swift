import Cocoa

var str = "Hello, playground"

print("The maximum Int value is \(Int.max).")
print("The minimum Int value is \(Int.min).")
print("The maximum 32-bit Int value is \(Int32.max).")
print("The minimum 32-bit Int value is \(Int32.min).")

print("The maximum UInt value is \(UInt.max).")
print("The minimum UInt value is \(UInt.min).")
print("The maximum 32-bit unsigned Int value is \(UInt32.max).")
print("The minimum 32-bit unsigned Int value is \(UInt32.min).")

let numberOfPeople: UInt = 40
let volumeAdjustment: Int32 = -1000
// let badNum: UInt = -5

// 5+ 6 having a space on one side and not on the other does not work
5 + 6

let y: Int8 = 120
//let x = y + 10
let z = y &+ 10
print(z)

// operating on two numbers with different types
let a: Int32 = 200
let b: Int16 = 50
let c = a + Int32(b)
let d = Int16(a) + b
//let c = a + b
