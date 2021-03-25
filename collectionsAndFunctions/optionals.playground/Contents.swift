import Cocoa

/*
var errorCodeString: Optional<String> // This var will hold either a string or nil value
errorCodeString = Optional("404")
*/
var errorCodeString: String? // shorthand way of typing it
errorCodeString = "404"

//print(errorCodeString)
/*
if errorCodeString != nil {
    let theError = errorCodeString!
    print(theError)
}
*/

// Optional binding: this is a way to safely check if there is a value in errorCodeString, but theError is only avaiable in the scope
// of the if conditional
/*
if let theError = errorCodeString {
    if let errorCodeInt = Int(theError) {
        print("\(theError): \(errorCodeInt)")
    }
}
*/

// Instead of nesting unwrapping optionals like above do this:
// Optional chaining is exemplified through the use of errorDescription and upCaseErrorDescription pg 100
var errorDescription: String?
if let theError = errorCodeString, let errorCodeInt = Int(theError), errorCodeInt == 404 {
    errorDescription = "\(errorCodeInt + 200): resource not found."
}

var upCaseErrorDescription = errorDescription?.uppercased()
upCaseErrorDescription?.append(" PLEASE TRY AGAIN.")
upCaseErrorDescription
// below is Nul Coalescing Operator: if errorDescription has Nil value then the description will be "No error"
let description = errorDescription ?? "No error"

/*
// Silver Challenge: force-unwrapping an optional when it is nil
var newCode: String?
let newError = newCode!
// Fatal error: Unexpectedly found nil while unwrapping an Optional value: file..., line 43
*/

