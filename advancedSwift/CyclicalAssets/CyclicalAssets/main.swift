//
//  main.swift
//  CyclicalAssets
//
//  Created by Jonathan Paul on 3/27/21.
//
// Swift uses Auttomatic Reference Counting to decide when to deinit memory so as long
// as the reference counter > 0, then the memory will be maintained

import Foundation

class Simulation {
    func run() {
        let vault13 = Vault(number: 13)
        print("Created \(vault13)")
        
        let coin: Asset = Asset(name: "Rare Coin", value: 1_000.0)
        let gem: Asset = Asset(name: "Big Dimond", value: 5_000.0)
        let poem: Asset = Asset(name: "Magnum Opus", value: 0.0)
        
        vault13.store(coin)
        vault13.store(gem)
        
        print("Created some assets: \([coin, gem, poem])")
        
        coin.value += 137
    }
}

let simulation = Simulation()
simulation.run()
dispatchMain()
