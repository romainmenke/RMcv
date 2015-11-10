//
//  Stats.swift
//  CV
//
//  Created by Romain Menke on 04/11/15.
//  Copyright © 2015 Romain Menke. All rights reserved.
//

import Foundation

struct Stats {
    
    var slaves : Int = 0
    var guards : Int = 0
    var rebels : Int = 0
    var followers : Int = 0
    var plagues : Int = 0
    var food : Int = 0
    var gold : Int = 0
    var yearsLeft : Int = 35
    var cats : Int = 0
    
    // convenience method to get the number of stats, used with subscript.
    let count = 9
    
    static func startingStatsB() -> Stats {
        return Stats(slaves: 1000, guards: 200, rebels: 50, followers: 50, plagues: 0, food: 200, gold: 0, yearsLeft: 35, cats: 2)
    }
    
    static let startingStats = Stats(slaves: 1000, guards: 200, rebels: 50, followers: 50, plagues: 0, food: 200, gold: 0, yearsLeft: 35, cats: 2)
    
}

extension Stats {
    /**
    Update stats after in game year
    */
    mutating func yearPassed() {
        slaves += 20 + (food / 200)
        guards += 1
        rebels += 1
        followers += 1
        plagues += 0
        cats += 1
        
        // prevent sub-zero
        food += 5 - ((slaves - 1200) / 80)
        if food < 0 {
            food = 0
        }
        
        // prevent sub-zero
        yearsLeft -= 1
        if yearsLeft < 0 {
            yearsLeft = 0
        }
    }
}

extension Stats {
    
    /**
    Convert Stats to Score
    */
    var score : Score {
        get {
            return getScore()
        }
    }
    
    private func getScore() -> Score {
    
        var gameScore : Int = 0
        gameScore += slaves * 2
        gameScore += guards * 10
        gameScore -= rebels * 10
        gameScore += followers * 50
        gameScore += food
        gameScore += yearsLeft * 500
        
        let score = Score(cats: cats, life: yearsLeft, game: gameScore)
        return score
    
    }
    
}

extension Stats {
    
    /**
    Modifiers for stats to convert to build speed
    */
    func modifier(valueIndex:Int) -> Double {
        
        switch valueIndex {
        case 0 :
            return 0.8
        case 1 :
            return 0.3
        case 2 :
            return -0.3
        case 3 :
            return 0.5
        case 4 :
            return -0.5
        case 5 :
            return 0.0
        case 6 :
            return 0.5
        case 7 :
            return 0.0
        case 8 :
            return 0.0
            
        default :
            return 0.0
        }
        
    }
}

extension Stats {
    
    /**
    The build speed of the pyramid.
    
    Use this as a Timer Interval to build the pyramid
    
    */
    var buildSpeed : Double {
        
        get {
            
            var tempSpeed : Double = 0
            
            for i in 0..<count {
                
                let val = Double(self[i])
                let mod = modifier(i)
                let result = val * mod
                
                tempSpeed += result
            }
            return (1000 / tempSpeed) / 1.3 // last divider is for balance. Increase to Speed Up, Decrease to Slow Down. Default is 1.7
        }
    }
}


extension Stats {
    
    // convenience subscript to get sum of two stats.
    subscript (index:Int) -> Int {
        
        get {
            
            if !(index < count) {
                return slaves
            }
            
            switch index {
            case 0 :
                return slaves
            case 1 :
                return guards
            case 2 :
                return rebels
            case 3 :
                return followers
            case 4 :
                return plagues
            case 5 :
                return food
            case 6 :
                return gold
            case 7 :
                return yearsLeft
            case 8 :
                return cats
                
            default :
                return slaves
            }
        }
        
        set(value) {
            
            if !(index < count) {
                slaves = value
            }
            
            switch index {
            case 0 :
                slaves = value
            case 1 :
                guards = value
            case 2 :
                rebels = value
            case 3 :
                followers = value
            case 4 :
                plagues = value
            case 5 :
                food = value
            case 6 :
                gold = value
            case 7 :
                yearsLeft = value
            case 8 :
                cats = value
                
            default :
                slaves = value
            }
        }
    }
}

func +(lhs:Stats,rhs:Stats) -> Stats {
    
    var result = Stats()
    
    for i in 0..<rhs.count {
        
        result[i] = lhs[i] + rhs[i]
        
        if result[i] < 0 {
            result[i] = 0
        }
        
    }
    return result
}


func +=(inout lhs:Stats,rhs:Stats) {
    
    lhs = lhs + rhs
    
}

