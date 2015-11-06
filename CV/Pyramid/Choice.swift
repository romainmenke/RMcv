//
//  Choices.swift
//  CV
//
//  Created by Romain Menke on 04/11/15.
//  Copyright © 2015 Romain Menke. All rights reserved.
//

import Foundation

/**
In Game Events
*/
struct Choice {
    
    var title : String = ""
    
    var left : String = ""
    var right : String = ""
    
    var leftResult : Stats = Stats()
    var rightResult : Stats = Stats()
    
    var leftAnimation : EventArt?
    var rightAnimation : EventArt?
    
    init(title: String, alpha: String, beta: String, alphaResult: Stats, betaResult: Stats, alphaAnimation: EventArt?, betaAnimation: EventArt?) {
        self.title = title
        
        // randomize the position of the event options to prevent having all good/bad options left or right
        
        if randomBool() {
            left = alpha
            right = beta
            leftResult = alphaResult
            rightResult = betaResult
            leftAnimation = alphaAnimation
            rightAnimation = betaAnimation
        } else {
            left = beta
            right = alpha
            leftResult = betaResult
            rightResult = alphaResult
            leftAnimation = betaAnimation
            rightAnimation = alphaAnimation
        }
        
    }
    
    // container for past events to prevent duplicate events
    static var pastChoices : [Int] = []
    
    // 11 preset choises
    
    static let moses = Choice(title: "Moses speaks",
        alpha: "Send Guards",
        beta: "Burn Food",
        alphaResult: Stats(slaves: -100, guards: -50, rebels: 50, followers: 0, plagues: 0, food: 0, gold: 0, yearsLeft: 0, cats: 0),
        betaResult: Stats(slaves: -50, guards: 0, rebels: 0, followers: 0, plagues: 0, food: -100, gold: 0, yearsLeft: 0, cats: -50),
        alphaAnimation: nil,
        betaAnimation: nil
    )
    
    static let poisonedDrink = Choice(title: "Your Brother Poisoned Your Drink",
        alpha: "Sacrifice Him To Ra",
        beta: "Sacrifice Him To Bastet",
        alphaResult: Stats(slaves: 0, guards: 0, rebels: 0, followers: 0, plagues: 0, food: 0, gold: 0, yearsLeft: +5, cats: 0),
        betaResult: Stats(slaves: 0, guards: 0, rebels: 0, followers: 0, plagues: 0, food: 0, gold: 0, yearsLeft: -5, cats: 500),
        alphaAnimation: nil,
        betaAnimation: nil
    )
    
    static let barbarians = Choice(title: "Barbarians Attack",
        alpha: "Send Army",
        beta: "Go On Vacation",
        alphaResult: Stats(slaves: +50, guards: -200, rebels: 0, followers: 0, plagues: 0, food: 0, gold: 0, yearsLeft: 0, cats: 0),
        betaResult: Stats(slaves: -50, guards: -50, rebels: 0, followers: 0, plagues: 0, food: -50, gold: -50, yearsLeft: 0, cats: 0),
        alphaAnimation: EventArt.army,
        betaAnimation: EventArt.barbarians
    )
    
    static let rebellion = Choice(title: "Rebellion",
        alpha: "Summon Lesser Diety",
        beta: "Talk It Out",
        alphaResult: Stats(slaves: -100, guards: 0, rebels: -50, followers: 50, plagues: 0, food: 0, gold: 0, yearsLeft: 0, cats: 0),
        betaResult: Stats(slaves: 0, guards: 0, rebels: -50, followers: 0, plagues: 0, food: 0, gold: 0, yearsLeft: -5, cats: 0),
        alphaAnimation: nil,
        betaAnimation: nil
    )
    
    static let goodHarvest = Choice(title: "Good Harvest",
        alpha: "Hold Party",
        beta: "Feed Slaves",
        alphaResult: Stats(slaves: 0, guards: 0, rebels: 0, followers: 0, plagues: 0, food: 50, gold: 0, yearsLeft: 0, cats: 0),
        betaResult: Stats(slaves: 100, guards: 0, rebels: -50, followers: 0, plagues: 0, food: 50, gold: 0, yearsLeft: 0, cats: 0),
        alphaAnimation: nil,
        betaAnimation: nil
    )
    
    static let flood = Choice(title: "Flood",
        alpha: "Save The Cats",
        beta: "Save The People",
        alphaResult: Stats(slaves: -200, guards: -100, rebels: 50, followers: 0, plagues: -5, food: -50, gold: 0, yearsLeft: 0, cats: 100),
        betaResult: Stats(slaves: -50, guards: 0, rebels: -50, followers: 0, plagues: -5, food: -50, gold: 0, yearsLeft: 0, cats: 0),
        alphaAnimation: nil,
        betaAnimation: nil
    )
    
    static let frogs = Choice(title: "Lots Of Frogs",
        alpha: "Eat The Frogs",
        beta: "Make Water Illegal",
        alphaResult: Stats(slaves: 50, guards: 50, rebels: 0, followers: -100, plagues: -5, food: 100, gold: 0, yearsLeft: -5, cats: 0),
        betaResult: Stats(slaves: -100, guards: -50, rebels: 50, followers: 0, plagues: -5, food: -50, gold: 0, yearsLeft: 0, cats: 0),
        alphaAnimation: nil,
        betaAnimation: nil
    )
    
    static let advisor = Choice(title: "Trusted Advisor Was Killed",
        alpha: "Send Cats To Investigate",
        beta: "Punish Some Slaves",
        alphaResult: Stats(slaves: 0, guards: 0, rebels: 0, followers: -50, plagues: 0, food: 0, gold: 0, yearsLeft: 0, cats: 0),
        betaResult: Stats(slaves: -50, guards: 0, rebels: 50, followers: 0, plagues: 0, food: 0, gold: 0, yearsLeft: 0, cats: 0),
        alphaAnimation: nil,
        betaAnimation: nil
    )
    
    static let vision = Choice(title: "You Had A Vision",
        alpha: "Drink Less Wine",
        beta: "Go To War",
        alphaResult: Stats(slaves: 0, guards: 0, rebels: 0, followers: 0, plagues: 0, food: 0, gold: 0, yearsLeft: 5, cats: 0),
        betaResult: Stats(slaves: 100, guards: -200, rebels: 0, followers: 50, plagues: 0, food: 0, gold: 0, yearsLeft: 0, cats: 0),
        alphaAnimation: nil,
        betaAnimation: EventArt.army
    )
    
    
    
    static let anotherDay = Choice(title: "A Quiet Day",
        alpha: "Take A Lot Of Naps",
        beta: "Demand Entertainment",
        alphaResult: Stats(slaves: 0, guards: 0, rebels: 0, followers: 0, plagues: 0, food: 0, gold: 0, yearsLeft: 0, cats: 0),
        betaResult: Stats(slaves: 0, guards: 0, rebels: 50, followers: 0, plagues: 0, food: 0, gold: 0, yearsLeft: 0, cats: 0),
        alphaAnimation: nil,
        betaAnimation: nil
    )
    
    static let birthday = Choice(title: "It's Your Birthday",
        alpha: "Build Another Statue Of Me",
        beta: "Free Meals For Everyone",
        alphaResult: Stats(slaves: -109, guards: 0, rebels: 0, followers: 0, plagues: 0, food: 0, gold: 0, yearsLeft: 0, cats: 0),
        betaResult: Stats(slaves: 50, guards: 0, rebels: -100, followers: 0, plagues: 0, food: -100, gold: 0, yearsLeft: 0, cats: 0),
        alphaAnimation: nil,
        betaAnimation: nil
    )

    
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


