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
}


