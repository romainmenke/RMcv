//
//  Score.swift
//  CV
//
//  Created by Romain Menke on 06/11/15.
//  Copyright © 2015 Romain Menke. All rights reserved.
//

import Foundation

/**
Container for Game Score
 */
struct Score {
    
    var catsScore : Int = 0
    var lifeScore : Int = 0
    var gameScore : Int = 0
    
    /**
     Convert to dictionary to pass to a plist
     */
    var dictionary : NSMutableDictionary {
        get {
            return dictFromScore()
        }
    }
    
    private func dictFromScore() -> NSMutableDictionary {
        
        let dict = NSMutableDictionary()
        dict["catsScore"] = catsScore
        dict["lifeScore"] = lifeScore
        dict["gameScore"] = gameScore
        
        return dict
        
    }
    
    init(cats:Int,life:Int,game:Int) {
        catsScore = cats
        lifeScore = life
        gameScore = game
    }
    
    // init from plist dict to be able to compare highscore and last score
    init?(dict:NSDictionary) {
        
        guard let propDict = dict as? [String:Int] else {
            return nil
        }
        
        guard let cats = propDict["catsScore"], let life = propDict["lifeScore"], let game = propDict["gameScore"] else {
            return nil
        }
        
        catsScore = cats
        lifeScore = life
        gameScore = game
        
    }
}

func <(lhs:Score,rhs:Score) -> Bool {
    
    if lhs.gameScore == rhs.gameScore {
        return (lhs.lifeScore <= rhs.lifeScore)
    }
    
    return (lhs.gameScore < rhs.gameScore)
    
}

func >(lhs:Score,rhs:Score) -> Bool {
    
    return (rhs < lhs)
}