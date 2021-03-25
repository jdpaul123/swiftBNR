//
//  main.swift
//  MonsterTownWithCh15Challenges
//
//  Created by Jonathan Paul on 3/25/21.
//

import Foundation

var myTown = Town()
myTown.changePopulation(by: 500)

//let fredTheZombie: Monster = Zombie() // Using polymorphism becasue we set our zombie to be the type of monster
let fredTheZombie = Zombie()
fredTheZombie.town = myTown
fredTheZombie.terrorizeTown()
fredTheZombie.town?.printDescription() // using .town? is an example of optional chaining (unwrapping an optional) to make sure there is a vlaue there
//(fredTheZombie as? Zombie)?.walksWithLimp = true
/*
The above not work with polymorphism when the type is set to Monster b/c Monster does not have this property
however, using typecasting with the conditional cast as? keyword fixes that.
Upcasting, from a subclass to a superclass is always safe, but not vice versa
*/
// structs are value types adn follow value semantics, while classes are reference types and follow reference semantics

// Silver Challenge
print()
let bobVampire = Vampire()
bobVampire.town = myTown
bobVampire.town?.printDescription()
bobVampire.terrorizeTown()
bobVampire.town?.printDescription()
bobVampire.terrorizeTown()
bobVampire.town?.printDescription()
bobVampire.terrorizeTown()
bobVampire.town?.printDescription()
