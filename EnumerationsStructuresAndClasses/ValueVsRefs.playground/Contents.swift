import Cocoa

// Value type examples below which use Value Semantics
var str = "Hello, playground"
var playgroundGreeting = str
playgroundGreeting += "! How are you today?"
str

// reference type examples below which use Reference Semantics
class Employee {
    var id: Int = 0
}

let anika = Employee()
let theBoss = anika

anika.id = 16
anika.id
theBoss.id

// constant value and reference types
struct Company {
    var boss: Employee
}
// for value types declared as constants, you cannot change their properties, even if the property are declared with var
// for reference types you can change the properties becasue when you change, for instance, mel you are not changing the memory ref
let acme = Company(boss: anika)
let mel = Employee()
mel.id = 86
mel.id

// using value and reference types together, using a ref type(ex. class) in a val type (ex. struct) can be problematic b/c
// you can change the ref type in one struct and it will be changed in another
acme.boss.id
let widgetCo = acme
anika.id = 15
widgetCo.boss.id

// Copying, copies in Swift are always shallow as opposed to deep
let jumpa = Employee()
// Arrays are built with struct so they are value types
let employees = [anika, mel, jumpa]
let partyGoers = employees
// when we change the id for employees it will change it for employees and partyGoers because the employees in the array
// are classes so they are referecne types even though partyGoers and employees arrays are value types
employees.last?.id = 4
employees
partyGoers
// a shallow copy of a value type copties the value and that is Employee in this case which is a reference type
// a deep copy would duplicate the instance at the destination of a reference so partGoers array would not reference the
// same instances of Employee. Instead, a deep copy of emplorees would create a new array with references to its own
// instances of Employee.

// Equality vs Identity
/* Equality is when the values are the same (==). Identity referes to whether two references point to the same instance
 in memory (===)*/
acme.boss === anika
let joe = Employee()
let sam = Employee()
joe === sam
// joe == sam uses an Equatable which will be discussed in ch 25


/*
 Struct or Classes?
 - If you want a type to be passed by reference, use a class. Doing so will ensure that hte type is referenced rather
 than copied when assigned or passed in to a function's argument
 - If the type needs to support inheritance, then use a class. Structs do not support inheritence and cannot be
 subclassed
 - Otherwise, you probably want a struct
 */
// marking a class as final class {...[} will disallow subclasses of that class
