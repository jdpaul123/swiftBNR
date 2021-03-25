import Cocoa

var statusCode: Int = 418
var errorString: String = "The request failed: "
switch statusCode {
case 401:
    errorString += "Unauthorized"
case 400...417:
    errorString += "Client error, \(statusCode)."
case 500...505:
    errorString += "Server error, \(statusCode)."
case let code where code < 100 || code >= 600:
    errorString = "\(code) is an illegal status code."
default:
    errorString = "Unexpected error encountered."
}

let arror = (code: statusCode, msg: errorString)
/*
// the variable, code, below is an expample of value binding
case let code:
    errorString = "\(code) is not a konwn error code."
}
*/

/*
switch statusCode {
case 401:
    errorString = "Unauthorized"
case 403:
    errorString = "Forbidden"
case 404:
    errorString = "Not Found"
default:
    errorString = "None"
}
*/

print(errorString)
