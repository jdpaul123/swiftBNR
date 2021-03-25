//
//  Zombie.swift
//  MonsterTownWithCh16Challenges
//
//  Created by Jonathan Paul on 3/25/21.
//

import Foundation

class Zombie: Monster {
    override class var spookyNoise: String {
        return "Brains..."
    }
    var walksWithLimp = true
    private(set) var isFallingApart = false // the setter cannot be more visable than the getter
    
    func regenerate() {
        walksWithLimp = false
    }
    
    override func terrorizeTown() {
        if !isFallingApart {
            town?.changePopulation(by: -10)
        }
        super.terrorizeTown()
        regenerate()
    }
}
