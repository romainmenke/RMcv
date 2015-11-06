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
    
    var yearTimer = NSTimer()
    var buildingTimer = NSTimer()
    var eventTimer = NSTimer()
    
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
    
    func yearLoop() {
        
        if !alive {
            return
        }
        
        currentStats.yearPassed()
        score.updateStats(currentStats)
        
        if currentStats.yearsLeft <= 0 {
            died()
        }
    }
    
    func buildLoop() {
        
        if !alive {
            return
        }
        
        buildingTimer.invalidate()
        buildingTimer = NSTimer.scheduledTimerWithTimeInterval(currentStats.buildSpeed, target: self, selector: Selector("buildLoop"), userInfo: nil, repeats: true)
        
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
    
    func buildingComplete() {
        pauseTimers()
        people.removeFromSuperview()
    }
    
    func died() {
        
        if let eventV = eventView {
            eventV.removeFromSuperview()
        }
        people.removeFromSuperview()
        pauseTimers()
        alive = false
        
        
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
            startTimers()
        }
        
        
        
    }
    
    func pauseTimers() {
        yearTimer.invalidate()
        buildingTimer.invalidate()
        eventTimer.invalidate()
        people.stop()
    }
    
    func startTimers() {
        yearTimer = NSTimer.scheduledTimerWithTimeInterval(1.0, target: self, selector: Selector("yearLoop"), userInfo: nil, repeats: true)
        buildingTimer = NSTimer.scheduledTimerWithTimeInterval(currentStats.buildSpeed, target: self, selector: Selector("buildLoop"), userInfo: nil, repeats: true)
        eventTimer = NSTimer.scheduledTimerWithTimeInterval(6.0, target: self, selector: Selector("eventLoop"), userInfo: nil, repeats: true)
        people.start()
    }
    
    /*
    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
    // Get the new view controller using segue.destinationViewController.
    // Pass the selected object to the new view controller.
    }
    */
    
}
