//
//  Mayor.swift
//  MonsterTownWithCh16Challenges
//
//  Created by Jonathan Paul on 3/25/21.
//

import Foundation

struct Mayor {
    private var anxietyLevel = 0
    
    mutating func sad() {
        print("I'm deeply saddened to her aboiut this latest tragedy. I promise that my office is looking into the nature of this rash of violence.")
        anxietyLevel += 1
        //print("Anxiety level: \(anxietyLevel)")
    }
}
