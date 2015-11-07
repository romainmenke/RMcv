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
    static var presetChoices : [Int] = [0,1,2,3,4,5,6,7,8,9,10,11,12]
    
    static func randomChoice() -> Choice {
        
        let randomIndex = randomInt(0, secondNum: presetChoices.count - 1)
        let randomC = presetChoices[randomIndex]
        presetChoices.removeAtIndex(randomIndex)
        
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
        case 11 :
            return Choice.bob
        case 12 :
            return Choice.aliens
        default :
            return Choice.birthday
        }
        
    }
}