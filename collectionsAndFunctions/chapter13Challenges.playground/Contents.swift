// Chapter 13 Challenges
import Cocoa

// Bronze Challenge: sort collection in place
var volunteerCounts = [1, 3, 40, 32, 2, 53, 77, 13]
volunteerCounts = volunteerCounts.sorted { $0 < $1 }
print(volunteerCounts)

// Silver Challenge: sort using a funciton that is simpler to sort the array
var volunteerCounts2 = [1, 3, 40, 32, 2, 53, 77, 13]
volunteerCounts = volunteerCounts.sorted()

// Gold Challenge: use map(_:), filter(_:), and/or reduce(_:_:) to find averages in as little code
let sortedRoundedAverages = [10.75, 4.2, 1.5, 12.12, 16.815].map() {Int($0.rounded())}
print(sortedRoundedAverages)
