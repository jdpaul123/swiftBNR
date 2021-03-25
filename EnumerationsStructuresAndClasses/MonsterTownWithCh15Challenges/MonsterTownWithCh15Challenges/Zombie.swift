//
//  Zombie.swift
//  MonsterTownWithCh15Challenges
//
//  Created by Jonathan Paul on 3/25/21.
//

import Foundation

class Zombie: Monster {
    var walksWithLimp = true
    
    func regenerate() {
        walksWithLimp = false
    }
    
    override func terrorizeTown() {
        town?.changePopulation(by: -10)
        super.terrorizeTown()
        regenerate()
    }
}
