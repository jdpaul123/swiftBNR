import Cocoa

protocol TabularDataSource {
    var numberOfRows: Int { get }
    var numberOfColumns: Int { get }
    
    func label(forColumn column: Int) -> String
    
    func itemFor(row: Int, column: Int) -> String
}

func printTable(_ dataSource: TabularDataSource & CustomStringConvertible) {
    print("Table: \(dataSource)")
    
    // Create header row containing column headers
    var headerRow = "|"
    
    // Also keep track of the width of each column
    var columnWidths = [Int]()
    
    for i in 0 ..< dataSource.numberOfColumns {
        let columnLabel = dataSource.label(forColumn: i)
        var columnHeader = " \(columnLabel) |"
        
        // Gold Challenge Ch. 19  Theres a wierd reason that I need to add 3 and sub 3 kinda jank
        var str = ""
        var longest = 0
        for x in 0 ..< dataSource.numberOfRows {
            str = dataSource.itemFor(row: x, column: i)
            if str.count > longest {
                longest = str.count
            }
        }
        var howMuchSpace = longest - columnHeader.count + 3
        if howMuchSpace < 0 {
            howMuchSpace = 0
        }
        columnHeader = repeatElement(" ", count: howMuchSpace).joined(separator: "") + columnHeader

        headerRow += columnHeader
        // Edited the line below for gold challenge Ch. 19
        columnWidths.append(columnHeader.count - 3)
    }
    print(headerRow)
    
    for i in 0 ..< dataSource.numberOfRows {
        // Start the output string
        var out = "|"
        
        // Append each item in this row to the string
        for j in 0 ..< dataSource.numberOfRows {
            let item = dataSource.itemFor(row: i, column: j)
            //print("j = \(j) and item = \(item)")
            var paddingNeeded = columnWidths[j] - item.count
            // Bronze Challenge: make it so it works for values greater than 999 Ch 19
            if paddingNeeded < 0 {
                paddingNeeded = 0
            }
            let padding = repeatElement(" ", count: paddingNeeded).joined(separator: "")
            out += " \(padding)\(item) |"
        }
        
        // Done - print it!
        print(out)
    }
}

struct Person {
    let name: String
    let age: Int
    let yearsOfExperience: Int
}



struct Department: TabularDataSource {
    let name: String
    var people = [Person]()
    
    
    
    init(name: String) {
        self.name = name
    }
    
    mutating func add(_ person: Person) {
        people.append(person)
    }
    
    var numberOfRows: Int {
        return people.count
    }
    
    var numberOfColumns: Int {
        return 3
    }
    
    func label(forColumn column: Int) -> String {
        switch column {
        case 0: return "Employee Name"
        case 1: return "Age"
        case 2: return "Years of Experience"
        default: fatalError("Invalid column!")
        }
    }
    
    func itemFor(row: Int, column: Int) -> String {
        let person = people[row]
        switch column {
        case 0: return person.name
        case 1: return String(person.age)
        case 2: return String(person.yearsOfExperience)
        default: fatalError("Invalid column!")
        }
    }
}


// Bronze Challenge Chapter 20
extension Department: CustomStringConvertible {
    var description: String {
        return "Department (\(name))"
    }
}

// struct Book and struct BookCollection are all part of the Silver Challenge Ch 19
struct Book {
    let title: String
    let authors: String
    let averageReviews: Double
}

struct BookCollection: TabularDataSource, CustomStringConvertible {
    let name: String
    var books = [Book]()
    
    var description: String {
        return "Type (\(name))"
    }
    
    init(name: String) {
        self.name = name
    }
    
    mutating func add(_ book: Book) {
        books.append(book)
    }
    
    var numberOfRows: Int {
        return books.count
    }
    
    var numberOfColumns: Int {
        return 3
    }
    
    func label(forColumn column: Int) -> String {
        switch column {
        case 0: return "Title"
        case 1: return "Author(s)"
        case 2: return "Average Amazon Reviews"
        default: fatalError("Invalid column!")
        }
    }
    
    func itemFor(row: Int, column: Int) -> String {
        let book = books[row]
        switch column {
        case 0: return book.title
        case 1: return book.authors
        case 2: return String(book.averageReviews)
        default: fatalError("Invalid column!")
        }
    }
}



var department = Department(name: "Engineering")
department.add(Person(name: "Eva", age: 1999, yearsOfExperience: 6))
department.add(Person(name: "Saleh", age: 40, yearsOfExperience: 18))
department.add(Person(name: "Amit", age: 50, yearsOfExperience: 20))

printTable(department)

let operationDataSource: TabularDataSource = Department(name: "Operations")
let engineeringDataSource = department as TabularDataSource

let mikey = Person(name: "Mikey", age: 37, yearsOfExperience: 10)
mikey is TabularDataSource

// Silver Challenge testing ch 19
var bookReview = BookCollection(name: "Programming Books")
bookReview.add(Book(title: "BNR Swift", authors: "A guy", averageReviews: 4.5))
bookReview.add(Book(title: "BNR Ios", authors: "Someone", averageReviews: 4.6))
bookReview.add(Book(title: "BNR Objective-C", authors: "He/She/They", averageReviews: 4.9))

printTable(bookReview)
