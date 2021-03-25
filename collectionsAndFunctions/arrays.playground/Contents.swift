import Cocoa

var bucketList: [String] = ["Write an iOS application"] // EQUIVALENT: var bucketList: Array<String>
bucketList.append("Read War and Peace")
bucketList.append("Go to Asia")
bucketList.append("Go to Europe")
bucketList.append("Visit 6 continents")
bucketList.count
bucketList.remove(at: 1)
bucketList
print(bucketList[...3])
bucketList[1] += " with friends"
bucketList[1]
bucketList[1] = "Go to Japan"
bucketList.insert("Mountain bike in MOAB", at: 1)
bucketList

var newItems = [
    "Bike across America",
    "Make a perfect souffle",
    "Solve Fermat's enigma"
]

bucketList += newItems
print(bucketList)

var anotherList = [
    "Bike across America",
    "Make a perfect souffle",
    "Solve Fermat's enigma"
]

newItems == anotherList

let lunches = [
    "Cheeseburger",
    "Veggie Pizza",
    "Chicken Caesar Salad",
    "Black Bean Burrito",
    "Falafel Wrap"
]

var toDoList = ["Take out the trash", "Pay bills", "Cross of finished items"]
toDoList.contains("Take out the trash")
toDoList.contains("Don't Take out the trash")
print(toDoList)
var temp = toDoList
var count = 0
// manual reverse using a temp
for item in toDoList {
    toDoList[count] = temp[toDoList.count - 1 - count]
    count += 1
}
print(toDoList)
// reverse method
toDoList = toDoList.reversed()
print(toDoList)
// Randomizes the order
toDoList.shuffle()
print(toDoList)
// chapter 9 Gold challenge below
var firstPay = toDoList.firstIndex(of: "Pay bills")
if let theToDo = firstPay {
    print(theToDo)
}
