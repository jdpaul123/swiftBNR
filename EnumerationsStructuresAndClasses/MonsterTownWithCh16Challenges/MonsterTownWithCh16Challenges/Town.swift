//
//  Town.swift
//  MonsterTownWithCh16Challenges
//
//  Created by Jonathan Paul on 3/25/21.
//

import Foundation

struct Town {
    var mayor: Mayor = Mayor()
    static let world = "Earth"
    let region = "Middle"
    var population = 5_422 {
        didSet(oldPopulation) {
            if population < oldPopulation {
                print("The population has changed to \(population) from \(oldPopulation).")
                mayor.sad()
            }
        }
    }
    
    var numberOfStopLights = 4
    
    enum Size {
        case small
        case medium
        case large
    }
    
    /* When using lazy for the townSize:
    Since townSize uses self when calling population, lazy tells the compiler that self can be creates without townSize being
    assigned. Thus, townSize is assigned once it is first 'read'(I think this means during runtime) instead of at compile time when self is created.
    bottomr of pg. 202 and top of pg. 203
    the parens at the ens of the closure execute the switch statement between the braces to store the Size value in townSize */
    
    var townSize: Size {
        switch population {
        case 0...10_000:
            return Size.small
        case 10_001...100_000:
            return Size.medium
        default:
            return Size.large
        }
    }
    
    func printDescription() {
        print("Population: \(population); number of stoplights: \(numberOfStopLights)")
    }
    
    // mutating keyword asks the compiler to make the implicit self argument inout, so that the instance
    // method can make changes to the original value the method was called on, instead of a copy
    mutating func changePopulation(by amount: Int) {
        population += amount
    }
    
}
