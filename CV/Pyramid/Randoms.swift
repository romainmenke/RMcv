//
//  Randoms.swift
//  CV
//
//  Created by Romain Menke on 04/11/15.
//  Copyright © 2015 Romain Menke. All rights reserved.
//

import Foundation


func randomFloat(firstNum: Float, secondNum: Float) -> Float {
    return Float(arc4random()) / Float(UINT32_MAX) * abs(firstNum - secondNum) + min(firstNum, secondNum)
}

func randomInt(firstNum: Int, secondNum: Int) -> Int {
    return Int(round(randomFloat(Float(firstNum), secondNum: Float(secondNum))))
}

func randomBool() -> Bool {
    
    if randomInt(0, secondNum: 1) == 0 {
        return false
    } else {
        return true
    }
    
}