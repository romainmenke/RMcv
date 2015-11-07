//
//  PresetChoices.swift
//  CV
//
//  Created by Romain Menke on 07/11/15.
//  Copyright © 2015 Romain Menke. All rights reserved.
//

import Foundation


extension Choice {
    
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
    
}