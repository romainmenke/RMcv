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
        
        guard let uwYearTimer = yearTimer, let uwBuildingTimer = buildingTimer, let uwChoiceTimer = choiceTimer, let uwPeopleTimer = peopleTimer else {
            return
        }
        
        uwYearTimer.pause()
        uwBuildingTimer.pause()
        uwChoiceTimer.pause()
        uwPeopleTimer.pause()
    }
    
    func startTimers() {
        
        guard let uwYearTimer = yearTimer, let uwBuildingTimer = buildingTimer, let uwChoiceTimer = choiceTimer, let uwPeopleTimer = peopleTimer else {
            return
        }
        
        uwYearTimer.start()
        uwBuildingTimer.start()
        uwChoiceTimer.start()
        uwPeopleTimer.start()
    }
    
    func resumeTimers() {
        
        guard let uwYearTimer = yearTimer, let uwBuildingTimer = buildingTimer, let uwChoiceTimer = choiceTimer, let uwPeopleTimer = peopleTimer else {
            return
        }
        
        uwYearTimer.resume()
        uwBuildingTimer.resume()
        uwChoiceTimer.resume()
        uwPeopleTimer.resume()
    }
    
    func pauseTimersForEvent() {
        
        guard let uwYearTimer = yearTimer, let uwBuildingTimer = buildingTimer, let uwChoiceTimer = choiceTimer, let uwPeopleTimer = peopleTimer else {
            return
        }
        
        uwYearTimer.pause()
        uwBuildingTimer.pause()
        uwChoiceTimer.invalidate()
        uwPeopleTimer.pause()
    }
    
    func resumeTimersAfterEvent() {
        
        guard let uwYearTimer = yearTimer, let uwBuildingTimer = buildingTimer, let uwChoiceTimer = choiceTimer, let uwPeopleTimer = peopleTimer else {
            return
        }
        
        uwYearTimer.resume()
        uwBuildingTimer.resume()
        uwChoiceTimer.start()
        uwPeopleTimer.resume()
    }
    
    func setupTimers() {
        yearTimer = PDTimer(timeInterval: 1.5, selector: yearLoop, repeats: true)
        buildingTimer = PDTimer(timeInterval: currentStats.buildSpeed, selector: buildLoop, repeats: false)
        choiceTimer = PDTimer(timeInterval: 5.0, selector: choiceLoop, repeats: true)
        peopleTimer = PDTimer(timeInterval: 0.1, selector: peopleLoop, repeats: true)
    }
    
}


extension PyramidOfDoomVC {
    
    func peopleLoop() {
        
        guard let uwPeople = people else {
            return
        }
        
        uwPeople.movePeople()
        
    }
    
    func yearLoop() {
        
        guard let uwStatsScreen = statsScreen where alive else {
            return
        }
        
        currentStats.yearPassed()

        uwStatsScreen.updateStats(currentStats)
        
        if currentStats.yearsLeft <= 0 {
            result()
            alive = false
            gameOngoing = false
        }
    }
    
    func buildLoop() {
        
        guard let uwBuildingTimer = buildingTimer, let uwPyramid = pyramid where alive else {
            return
        }
        
        uwBuildingTimer.invalidate()
        
        buildingTimer = PDTimer(timeInterval: currentStats.buildSpeed, selector: buildLoop, repeats: false)
        buildingTimer!.start()
        
        uwPyramid.build()
    }
    
    func choiceLoop() {
        
        if !alive || !gameOngoing {
            return
        }
        
        choiceView = ChoicePresenter(containerSize: self.view.frame.size)
        choiceView!.delegate = self
        self.view.addSubview(choiceView!)
        
        pauseTimersForEvent()
        
    }
    
}
