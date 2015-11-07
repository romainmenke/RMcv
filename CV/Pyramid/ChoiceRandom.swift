//
//  ChoiceRandom.swift
//  CV
//
//  Created by Romain Menke on 07/11/15.
//  Copyright © 2015 Romain Menke. All rights reserved.
//

import Foundation


extension Choice {
    
    // container for past events to prevent duplicates
    static var pastChoices : [Int] = []
    
    
    static func randomChoice() -> Choice {
        
        var randomC = randomInt(0, secondNum: 9)
        
        // this needs optimization, can theoratically create an infinite loop. convert to array that holds preset events and randomize the index
        while pastChoices.contains(randomC) {
            randomC = randomInt(0, secondNum: 9)
        }
        
        pastChoices.append(randomC)
        
        switch randomC {
        case 0 :
            return Choice.moses
        case 1 :
            return Choice.poisonedDrink
        case 2 :
            return Choice.barbarians
        case 3 :
            return Choice.rebellion
        case 4 :
            return Choice.goodHarvest
        case 5 :
            return Choice.flood
        case 6 :
            return Choice.frogs
        case 7 :
            return Choice.advisor
        case 8 :
            return Choice.vision
        case 9 :
            return Choice.anotherDay
        case 10 :
            return Choice.birthday
        default :
            return Choice.birthday
        }
        
    }
}