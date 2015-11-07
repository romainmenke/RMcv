//
//  PoDTimers.swift
//  CV
//
//  Created by Romain Menke on 07/11/15.
//  Copyright © 2015 Romain Menke. All rights reserved.
//

import UIKit


extension PyramidOfDoomVC {
    
    func pauseTimers() {
        yearTimer.pause()
        buildingTimer.pause()
        eventTimer.pause()
        peopleTimer.pause()
    }
    
    func startTimers() {
        yearTimer.start()
        buildingTimer.start()
        eventTimer.start()
        peopleTimer.start()
    }
    
    func resumeTimers() {
        yearTimer.resume()
        buildingTimer.resume()
        eventTimer.resume()
        peopleTimer.resume()
    }
    
    func setupTimers() {
        yearTimer = PDTimer(timeInterval: 1.0, selector: yearLoop, repeats: true)
        buildingTimer = PDTimer(timeInterval: currentStats.buildSpeed, selector: buildLoop, repeats: true)
        eventTimer = PDTimer(timeInterval: 6.0, selector: eventLoop, repeats: true)
        peopleTimer = PDTimer(timeInterval: 0.1, selector: moveLoop, repeats: true)
    }
    
}


extension PyramidOfDoomVC {
    
    func moveLoop() {
        
        people.loopMove()
        
    }
    
    func yearLoop() {
        
        if !alive {
            return
        }
        
        currentStats.yearPassed()
        score.updateStats(currentStats)
        
        if currentStats.yearsLeft <= 0 {
            result(false)
        }
    }
    
    func buildLoop() {
        
        if !alive {
            return
        }
        buildingTimer.invalidate()
        buildingTimer = PDTimer(timeInterval: currentStats.buildSpeed, selector: buildLoop, repeats: false)
        buildingTimer.start()
        
        pyr.build()
    }
    
    func eventLoop() {
        
        if !alive {
            return
        }
        
        choiceView = ChoicePresenter(containerSize: self.view.frame.size)
        choiceView!.delegate = self
        self.view.addSubview(choiceView!)
        
        pauseTimers()
        
    }
    
}
