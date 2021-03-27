import Cocoa

enum Token: CustomStringConvertible {
    case number(Int)
    case plus
    case minus
    case multiplier
    case divisor
    
    var description: String {
        switch self {
        case .number(let n):
            return "Number: \(n)"
        case .plus:
            return "Symbol: +"
        case .minus:
            return "Symbol: -"
        // Gold Challenge Chapter 23: Adding multiplier and divsor with recursive decent
        case .multiplier:
            return "Symbol: *"
        case .divisor:
            return "Symbol: /"
        }
    }
}

class Lexer {
    enum Error: Swift.Error {
        // Silver Challenge (part of) chapter 23
        case invalidCharacter(Character, String.Index)
    }
    
    let input: String
    var position: String.Index
    
    init(input: String) {
        self.input = input
        self.position = input.startIndex
    }
    
    func peek() -> Character? {
        guard position < input.endIndex else {
            return nil
        }
        return input[position]
    }
    
    func advance() {
        // precondition(_:_:) is same as assert() but will work in release mode compilation
        assert(position < input.endIndex, "Cannot advance past endIndex!")
        position = input.index(after: position)
    }
    
    func getNumber() -> Int {
        var value = 0
        
        while let nextCharacter = peek() {
            switch nextCharacter {
            case "0"..."9":
                // Another digit - add it into value
                let digitValue = Int(String(nextCharacter))!
                value = 10*value + digitValue
                advance()
            
            default:
                // Something unexpected - need to send back an arror
                return value
            }
        }
        
        return value
        
    }
    
    func lex() throws -> [Token] {
        var tokens = [Token]()
        
        while let nextCharacter = peek() {
            switch nextCharacter {
            case "0"..."9":
                // Start of a number - need to grab the res
                let value = getNumber()
                tokens.append(.number(value))
            case "*":
                tokens.append(.multiplier)
                advance()
            case "/":
                tokens.append(.divisor)
                advance()
            case "+":
                tokens.append(.plus)
                advance()
            case "-":
                tokens.append(.minus)
                advance()
            case " ":
                // Just advance to ignore spaces
                advance()
            
            default:
                // Something unexpected - need to send back an error
                // Silver Challenge (part of) chapter 23
                throw Lexer.Error.invalidCharacter(nextCharacter, position)
            }
        }
        return tokens
    }
}

class Parser {
    enum Error: Swift.Error {
        case unexpextedEndOfInput
        case invalidToken(Token)
    }
    
    var tokens: [Token]
    var position = 0
    
    init(tokens: [Token]) {
        self.tokens = tokens
    }
    
    func getNextToken() -> Token? {
        guard position < tokens.count else {
            return nil
        }
        let token = tokens[position]
        position += 1
        return token
    }
    
    func getNumber() throws -> Int {
        
        guard let token = getNextToken() else {
            throw Parser.Error.unexpextedEndOfInput
        }
        
        switch token {
        case .number(let value):
            return value
        case .plus:
            throw Parser.Error.invalidToken(token)
        case .minus:
            throw Parser.Error.invalidToken(token)
        case .multiplier:
            throw Parser.Error.invalidToken(token)
        case .divisor:
            throw Parser.Error.invalidToken(token)
        }
    }
    
    func parseE() throws -> Int {
        var value = try getNumber()
        while let token = getNextToken() {
            switch token {
            
            // Getting a plus after a number is legal
            case .plus:
                // After a plus, we must get another number
                let nextNumber = try getNumber()
                value += nextNumber
            case .minus:
                let nextNumber = try getNumber()
                value -= nextNumber
                
            // Getting a number after a number is not legal
            case .number:
                throw Parser.Error.invalidToken(token)
            case .multiplier:
                throw Parser.Error.invalidToken(token)
            case .divisor:
                throw Parser.Error.invalidToken(token)
            }
        }
        
        return value
    }
    
    func parseT() throws -> Int {
        // Parse the term with mult or div
        var value = try getNumber()
        
        while let token = getNextToken() {
            switch token {
            case .multiplier:
                let nextNumber = try getNumber()
                value *= nextNumber
            case .divisor:
                let nextNumber = try getNumber()
                value /= nextNumber
            case .number:
                throw Parser.Error.invalidToken(token)
            case .plus:
                throw Parser.Error.invalidToken(token)
            case .minus:
                throw Parser.Error.invalidToken(token)
            }
        }
        return value
    }
    
    func parse() throws -> Int {
        // Require a number first
        var value = try getNumber()
        
        while let token = getNextToken() {
            switch token {
            
            // Getting a plus after a number is legal
            case .plus:
                // After a plus, we must get another number
                let nextNumber = try getNumber()
                value += nextNumber
            case .minus:
                let nextNumber = try getNumber()
                value -= nextNumber
                
            // Getting a number after a number is not legal
            case .number:
                throw Parser.Error.invalidToken(token)
            case .multiplier:
                throw Parser.Error.invalidToken(token)
            case .divisor:
                throw Parser.Error.invalidToken(token)
            }
        }
        
        return value
    }
    }

func evaluate(_ input: String) {
    print("Evaluating: \(input)")
    let lexer = Lexer(input: input)
//    guard let tokens = try? lexer.lex() else {
//        print("Lexing failed, nint I don't know why")
//        return
//    }
    
    do {
        let tokens = try lexer.lex()
        print("Lexer output: \(tokens)")
        
        let parser = Parser(tokens: tokens)
        let resultT = try parser.parseT()
        let resultE = try parser.parseE()
        print("Parser output: \(resultE)")
    } catch Lexer.Error.invalidCharacter(let character, let position) {
        // Silver Challenge (part of) chapter 23 both the let position above, and to: position below
        let distanceToPosition = input.distance(from: input.startIndex, to: position)
        print("Input contained an invalid character at \(distanceToPosition): \(character)")
    } catch Parser.Error.unexpextedEndOfInput {
        print("Unexpected end of input during parsing")
    } catch Parser.Error.invalidToken(let token) {
        print("Invalid token during parsing: \(token)")
    } catch {
        print("An error occured: \(error)")
    }
}

evaluate("10 + 3 + 5")
// Bronze Challenge Chapter 23: Adding functionality for minus (-)
evaluate("10 + 5 - 3 - 1")
evaluate("10 * 3 + 5 * 3")

// COME BACK TO THE CHAPTER 23 GOLD CHALLENGE!
