//
//  main.swift
//  MonsterTownWithCh16Challenges
//
//  Created by Jonathan Paul on 3/25/21.
//

import Foundation

var myTown = Town()
let myTownSize = myTown.townSize
print(myTownSize)
myTown.changePopulation(by: 1_000_000)
print("Size: \(myTown.townSize); population \(myTown.population)")

let fredTheZombie = Zombie()
fredTheZombie.town = myTown
fredTheZombie.terrorizeTown()
fredTheZombie.town?.printDescription() // using .town? is an example of optional chaining (unwrapping an optional) to make sure there is a vlaue there

print()
print("Victim pool: \(fredTheZombie.victimPool)")
fredTheZombie.victimPool = 500
print("Victim pool: \(fredTheZombie.victimPool);")
print(Zombie.spookyNoise)
if Zombie.isTerrifying {
    print("Run away!")
}
