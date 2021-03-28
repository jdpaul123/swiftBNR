//
//  Town.swift
//  MonsterTown
//
//  Created by Jonathan Paul on 3/25/21.
//

import Foundation

struct Town {
    static let world = "Earth"
    let region: String
    // The line below is for Chapter 26 Bronze challenge, hence why the 7 lines below the line below are commented out
    @Logged(warningValue: 50) var population: Int = 100
//    {
//        didSet(oldPopulation) {
//            if population < oldPopulation {
//                print("The population has changed to \(population) from \(oldPopulation).")
//            }
//        }
//    }
    
    var numberOfStopLights: Int
    
    init?(region: String, population: Int, stopLights: Int) {
        guard population > 0 else {
            return nil
        }
        self.region = region
        self.population = population
        numberOfStopLights = stopLights
    }
    
    init?(population: Int, stopLights: Int) {
        self.init(region: "N/A", population: population, stopLights: stopLights)
    }
    
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
        print("Population: \(population); number of stoplights: \(numberOfStopLights); region \(region)")
    }
    
    // mutating keyword asks the compiler to make the implicit self argument inout, so that the instance
    // method can make changes to the original value the method was called on, instead of a copy
    mutating func changePopulation(by amount: Int) {
        population += amount
    }
    
}
