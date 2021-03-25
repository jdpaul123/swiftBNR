//
//  Monster.swift
//  MonsterTownWithCh15Challenges
//
//  Created by Jonathan Paul on 3/25/21.
//

import Foundation

class Monster {
    var town:Town?
    var name = "Monster" // Monster is the defualt value
    
    func terrorizeTown() {
        if town != nil {
            print("\(name) is terrorizing a town!")
        } else {
            print("\(name) hasn't found a town to terrorize yet...")
        }
    }
}
