import Cocoa

let population: Int = 5422
let message: String
let hasPostOffice: Bool = true

if population < 10000 {
    message = "\(population) is a small town!"
} else if population >= 10000 && population < 50000 {
        message = "\(population) is a medium town!"
    
} else {
    message = "\(population) is pretty big!"
    
}
print(message)

if !hasPostOffice {
    print("Where do we buy stamps?")
}
