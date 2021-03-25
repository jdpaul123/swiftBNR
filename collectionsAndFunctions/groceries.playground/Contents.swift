// Chapter 11 Sets
import Cocoa
// var groceryList = Set<String>(["Apples", "Oranges"])
// explicit Set type annotation with array literal syntax
var groceryList: Set = ["Apples", "Oranges"]
groceryList.insert("Kiwi")
groceryList.insert("Pears")

for food in groceryList {
    print(food)
}

groceryList.remove("Pears")
let hadBananas = groceryList.contains("Bananas")

// Unions, intersections, disjoints
let friendsGroceryList = Set(["Bananas", "Cerial", "Milk", "Oranges"])
let sharedList = groceryList.union(friendsGroceryList)
let duplicateItems = groceryList.intersection(friendsGroceryList)
let disjoint = groceryList.isDisjoint(with: friendsGroceryList) // returns false if there are any members that are the same
// symetricDifference(_:) tells you whuch items appear in one and only one of your lists
// Sets are good for comparing content in ways that arrays and dictionaries cannot compete with
// You can turn an array into a set so you can compare arrays better
// track who won each game in an array below
let players = ["Anna", "Vijay", "Jenka"]
let winners = ["Jenka", "Jenka", "Vijay", "Jenka"]
// to find who has not won turn these two Arrays into Sets and use the subtractnig(_:) method
let playerSet = Set(players)
let winnerSet = Set(winners)

playerSet.subtracting(winnerSet)

// Bronze Challenge
let myCities: Set = ["Atlanta", "Chicago", "Jacksonville", "New York", "Denver"]
let yourCities: Set = ["Chicago", "Denver", "Jacksonville"]
myCities.isSuperset(of: yourCities)
yourCities.isSubset(of: myCities)

// Silver Challenge: in place versions of Union and Intersection
groceryList.formUnion(friendsGroceryList)
groceryList.formIntersection(friendsGroceryList)
