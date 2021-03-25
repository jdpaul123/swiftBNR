import Cocoa

for i in 1...100 {
    /*
    if i % 3 == 0 && i % 5 == 0 {
        print("FIZZ BUZZ")
    } else if i % 3 == 0 {
        print("FIZZ")
    } else if i % 5 == 0 {
        print("BUZZ")
    } else {
        print(i)
    }
    */
    let tup = (i % 3, i % 5)
    switch tup {
    case (0, 0):
        print("FIZZ BUZZ")
    case (0, _):
        print("FIZZ")
    case (_, 0):
        print("BUZZ")
    default:
        print(i)
    }
}
