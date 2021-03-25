//
//  Monster.swift
//  MonsterTownWithCh17Challenges
//
//  Created by Jonathan Paul on 3/25/21.
//

import Foundation

class Monster {
    // subclasses can override class type properties, but not static type properties
    static let isTerrifying = true
    class var spookyNoise: String {
        return "Grrr..."
    }
    var town: Town?
    var name: String // Monster is the defualt value
    var victimPool: Int {
        get {
            return town?.population ?? 0 // ?? 0 is the nil coalescing operator
        }
        set(newVictimPool) {
            town?.population = newVictimPool
        }
    }
    
    // Gold challenge: turning the init of monster into a failable initializer
    required init?(town: Town?, monsterName: String) {
        self.town = town
        guard monsterName.count > 0 else {
            return nil
        }
        name = monsterName
    }
    
    func terrorizeTown() {
        if town != nil {
            print("\(name) is terrorizing a town!")
        } else {
            print("\(name) hasn't found a town to terrorize yet...")
        }
    }
}
