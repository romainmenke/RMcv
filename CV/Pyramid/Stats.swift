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
    
    let count = 9
    
    mutating func yearPassed() {
        slaves += 20 + (food / 200)
        guards += 1
        rebels += 1
        followers += 1
        plagues += 0
        food += 5 - ((slaves - 1200) / 80)
        cats += 1
        yearsLeft -= 1
        if yearsLeft < 0 {
            yearsLeft = 0
        }
    }
    
}

internal struct StatsGenerator: GeneratorType {
    
    let value: Stats
    var indexInSequence = 0
    
    init(value: Stats) {
        self.value = value
    }
    
    mutating internal func next() -> Int? {
        
        if !(indexInSequence < 9) {
            indexInSequence = 0
            return nil
        }
        
        switch indexInSequence {
        case 0 :
            return value.slaves
        case 1 :
            return value.guards
        case 2 :
            return value.rebels
        case 3 :
            return value.followers
        case 4 :
            return value.plagues
        case 5 :
            return value.food
        case 6 :
            return value.gold
        case 7 :
            return value.yearsLeft
        case 8 :
            return value.cats

        default :
            return nil
        }
    }
}

extension Stats: SequenceType {
    internal func generate() -> StatsGenerator {
        return StatsGenerator(value: self)
    }
}

extension Stats {
    
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
    
    var buildSpeed : Double {
        
        get {
            
            var tempSpeed : Double = 0
            
            for i in 0..<count {
                
                let val = Double(self[i])
                let mod = modifier(i)
                let result = val * mod
                
                tempSpeed += result
            }
            
            return (1000 / tempSpeed) / 1.5
        }
    }
}

extension Stats {
    
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

