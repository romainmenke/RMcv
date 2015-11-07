//
//  PyramidOfDoom.swift
//  CV
//
//  Created by Romain Menke on 05/11/15.
//  Copyright © 2015 Romain Menke. All rights reserved.
//

import UIKit

class PyramidOfDoomVC: UIViewController, PyramidDelegate, ChoiceDelegate {
    
    var currentStats = Stats(slaves: 1000, guards: 200, rebels: 50, followers: 50, plagues: 0, food: 200, gold: 0, yearsLeft: 35, cats: 2)
    
    var yearTimer = PDTimer()
    var buildingTimer = PDTimer()
    var eventTimer = PDTimer()
    var peopleTimer = PDTimer()
    
    var pyr : PyramidAscii!
    
    var people : PeopleAscii!
    
    var score : StatsScreen!
    
    var eventView : EventAscii?
    
    var choiceView : ChoicePresenter?
    
    var alive : Bool = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
        pyr = PyramidAscii(frame: CGRect(x: 100, y: 150, width: 120, height: 110))
        pyr.builderDelegate = self
        
        people = PeopleAscii(frame: CGRect(x: 0, y: 230, width: self.view.frame.width, height: 20))
        
        score = StatsScreen(frame: self.view.frame)
        
        self.view.addSubview(pyr)
        self.view.backgroundColor = pyr.sandColor
        
        self.view.addSubview(people)
        
        self.view.addSubview(score)
        score.updateStats(currentStats)
        
    }
    
    override func viewDidAppear(animated: Bool) {
        
        if !alive {
            currentStats = Stats(slaves: 1000, guards: 200, rebels: 50, followers: 50, plagues: 0, food: 200, gold: 0, yearsLeft: 35, cats: 2)
            pyr = PyramidAscii(frame: CGRect(x: 100, y: 150, width: 120, height: 110))
            pyr.builderDelegate = self
            
            people = PeopleAscii(frame: CGRect(x: 0, y: 230, width: self.view.frame.width, height: 20))
            
            
            self.view.addSubview(pyr)
            
            self.view.addSubview(people)
            
            score.updateStats(currentStats)
        }
        setupTimers()
        startTimers()
    }
    
    override func viewWillDisappear(animated: Bool) {
        pauseTimers()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prefersStatusBarHidden() -> Bool {
        return true
    }
    
    
    func buildingComplete() {
        result(true)
    }
    
    
    func result(alive:Bool) {
        
        pauseTimers()
        newScore(currentStats.score)
        
        people.removeFromSuperview()
        pyr.removeFromSuperview()
        score.removeFromSuperview()
        if let eventV = eventView {
            eventV.removeFromSuperview()
        }
        
        if let choiceV = choiceView {
            choiceV.removeFromSuperview()
        }
        
        let resultView = ScoreScreen(containerSize: self.view.frame.size, stats: currentStats)
        self.view.addSubview(resultView)
        
    }
    
    func theChoseOne(statsMod: Stats, animation: EventArt?) {
        
        if let cView = choiceView {
            cView.removeFromSuperview()
        }
        
        if let ani = animation {
            eventView = EventAscii(frame: CGRect(x: -100, y: 245, width: self.view.frame.width, height: 20), animation: ani)
            self.view.addSubview(eventView!)
            eventView!.start()
        }
        
        currentStats += statsMod
        score.updateStats(currentStats)
        
        if alive {
            peopleTimer.resume()
            buildingTimer.resume()
            eventTimer.start()
            yearTimer.resume()
        }
        
        
        
    }
    
}
