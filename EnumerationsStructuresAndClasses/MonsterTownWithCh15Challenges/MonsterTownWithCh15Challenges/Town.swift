//
//  Town.swift
//  MonsterTownWithCh15Challenges
//
//  Created by Jonathan Paul on 3/25/21.
//

import Foundation

struct Town {
    var population = 5_422
    var numberOfStopLights = 4
    
    func printDescription() {
        print("Population: \(population); number of stoplights: \(numberOfStopLights)")
    }
    
    // mutating keyword asks the compiler to make the implicit self argument inout, so that the instance
    // method can make changes to the original value the method was called on, instead of a copy
    mutating func changePopulation(by amount: Int) {
        // Bronze Challenge: accounting for a population less than 0
        let newPop = population + amount
        if newPop < 0 {
            population = 0
        } else {
            population += amount
        }
    }
}
