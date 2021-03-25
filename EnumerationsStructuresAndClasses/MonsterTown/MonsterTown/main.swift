//
//  main.swift
//  MonsterTown
//
//  Created by Jonathan Paul on 3/25/21.
//

import Foundation

var myTown = Town(population: 0, stopLights: 6)
myTown?.printDescription()
let myTownSize = myTown?.townSize
print(String(describing: myTownSize))
myTown?.changePopulation(by: 1_000_000)
print("Size: \(String(describing: myTown?.townSize)); population \(String(describing: myTown?.population))")


print()
var fredTheZombie: Zombie? = Zombie(limp: false, fallingApart: false, town: myTown, monsterName: "Fred")
fredTheZombie?.terrorizeTown()
fredTheZombie?.town?.printDescription() // using .town? is an example of optional chaining (unwrapping an optional) to make sure there is a vlaue there
    
print()
var convenientZombie = Zombie(limp: true, fallingApart: false)

print()
print("Victim pool: \(String(describing: fredTheZombie?.victimPool))")
fredTheZombie?.victimPool = 500
print("Victim pool: \(String(describing: fredTheZombie?.victimPool));")
print(Zombie.spookyNoise)
if Zombie.isTerrifying {
    print("Run away!")
}

print()
fredTheZombie = nil // this is where you de-init the zombie type
