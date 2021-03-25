//
//  Vampire.swift
//  MonsterTownWithCh15Challenges
//
//  Created by Jonathan Paul on 3/25/21.
//

import Foundation

// Silver Challenge
class Vampire: Monster {
    
    var thralls = [Vampire]()
    
    override func terrorizeTown() {
        town?.changePopulation(by: -1)
        thralls.append(Vampire())
        super.terrorizeTown()
    }
}
