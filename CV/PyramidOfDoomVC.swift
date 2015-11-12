//
//  PyramidOfDoom.swift
//  CV
//
//  Created by Romain Menke on 05/11/15.
//  Copyright © 2015 Romain Menke. All rights reserved.
//

// proof of concept game to illustrate text as a means to create graphics

import UIKit

class PyramidOfDoomVC: UIViewController, PyramidDelegate, ChoiceDelegate, ScoreScreenDelegate {
    
    class func sandColor() -> UIColor {
        return UIColor(red: 1.0, green: 0.9, blue: 0.4, alpha: 1.0)
    }
    class func darkSandColor() -> UIColor {
        return UIColor(red: 0.7, green: 0.5, blue: 0.2, alpha: 1.0)
    }
    
    
    // stats
    var currentStats = Stats.startingStats()
    
    // timers
    var yearTimer : PDTimer?
    var buildingTimer : PDTimer?
    var choiceTimer : PDTimer?
    var peopleTimer : PDTimer?
    
    // animation views
    var pyramid : PyramidAscii?
    var people : PeopleAscii?
    var statsScreen : StatsScreen?
    var eventView : EventAscii?
    
    // event view
    var choiceView : ChoicePresenter?
    
    // bools
    var alive : Bool = true
    var gameOngoing : Bool = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    
    override func viewWillAppear(animated: Bool) {

        setup()
        
    }
    
    override func viewWillDisappear(animated: Bool) {
        cleanUp()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prefersStatusBarHidden() -> Bool {
        return true
    }
    
    
    func buildingComplete() {
        
        gameOngoing = false
        result()
        
    }
    
}


extension PyramidOfDoomVC {
    
    func cleanUp() {
        
        for subview in self.view.subviews {
            
            subview.removeFromSuperview()
            
        }
        
        pauseTimers()
        
        yearTimer = nil
        buildingTimer = nil
        choiceTimer = nil
        peopleTimer = nil
        
        pyramid = nil
        people = nil
        statsScreen = nil
        eventView = nil
        
        choiceView = nil
        
        alive = false
        gameOngoing = false
        
    }
    
    func setup() {
        
        currentStats = Stats.startingStats()

        pyramid = PyramidAscii(frame: CGRect(x: (self.view.frame.width - 120) / 2, y: 150, width: 120, height: 110))
        pyramid!.builderDelegate = self
        
        people = PeopleAscii(frame: CGRect(x: 0, y: 230, width: self.view.frame.width, height: 20))
        
        statsScreen = StatsScreen(frame: self.view.frame)
        statsScreen!.updateStats(currentStats)
        
        alive = true
        gameOngoing = true
        
        setupTimers()
        startTimers()
        
        self.view.addSubview(pyramid!)
        self.view.addSubview(people!)
        self.view.addSubview(statsScreen!)
        
        self.view.backgroundColor = PyramidOfDoomVC.sandColor()
        
    }
    
}


extension PyramidOfDoomVC {
    
    func dismissScoreScreen() {
        cleanUp()
        setup()

    }
}




