//
//  PDTimer.swift
//  CV
//
//  Created by Romain Menke on 06/11/15.
//  Copyright © 2015 Romain Menke. All rights reserved.
//

import Foundation


class PDTimer : NSObject {
    
    private var timeInterval : NSTimeInterval
    private let selector : () -> ()
    private let repeats : Bool
    
    private var timer : NSTimer?
    private var resumeTimer : NSTimer?
    
    
    private var lastShot : NSDate?
    private var resumeTimeInterval : NSTimeInterval?
    
    private var paused : Bool = false
    private var running : Bool = false
    
    override init() {
        selector = {}
        timeInterval = 0
        repeats = false
    }
    
    init(timeInterval timeInterval_I : NSTimeInterval, selector selector_I:() -> (), repeats repeats_I: Bool) {
        
        timeInterval = timeInterval_I
        repeats = repeats_I
        selector = selector_I
        
        super.init()
        
    }
    
}

// invalidate PDTimer
extension PDTimer {
    
    func invalidate() {
        
        if let uwTimer = timer {
            uwTimer.invalidate()
        }
        
        if let uwResumeTimer = resumeTimer {
            uwResumeTimer.invalidate()
        }
        
        running = false
        paused = false
        timer = nil
        resumeTimer = nil
        
    }
}


// start PDTimer
extension PDTimer {
    
    func start() {
        
        // prevent duplicate timers
        if !running {
            
            // set bools
            paused = false
            running = true
            
            // record start time
            lastShot = NSDate()
            // schedule timer
            timer = NSTimer.scheduledTimerWithTimeInterval(timeInterval, target: self, selector: Selector("fire"), userInfo: nil, repeats: repeats)
        }
    }

    
    func fire() {
        // record execution time
        lastShot = NSDate()
        
        // if (running == false) dont execute
        if !running {
            return
        }
        
        // execute
        selector()
    }
}

// pause PDTimer
extension PDTimer {
    
    internal func pause() {
        
        invalidate()
        
        guard let uwLastShot = lastShot else {
            return
        }
        
        if !paused {
            resumeTimeInterval = NSDate().timeIntervalSinceDate(uwLastShot)
        }
        
        paused = true
        running = false
        
    }
    
    internal func resume() {
        
        if !paused {
            return
        }
        
        // set paused to false
        paused = false
        running = true
        
        // check that there is a previous interval
        guard let uwResumeTimeInterval = resumeTimeInterval else {
            start() // else start normal interval
            return
        }
        
        // start resumt timer
        resumeTimer = NSTimer.scheduledTimerWithTimeInterval(uwResumeTimeInterval, target: self, selector: Selector("executeOnceAndResume"), userInfo: nil, repeats: false)
    }
    
    internal func executeOnceAndResume() {
        // register date
        lastShot = NSDate()
        
        // if (running == false) dont execute
        if !running {
            return
        }
        
        selector()
        
        running = false
        start()
        
    }
}

extension PDTimer {
    
    // something wrong
    func updateInterval(timeInterval timeInterval_I: NSTimeInterval) {
        
        pause()
        
        let intervalDifference = timeInterval - timeInterval_I
        
        guard let uwResumeTimeInterval = resumeTimeInterval else {
            return
        }
        print(resumeTimeInterval!)
        resumeTimeInterval = uwResumeTimeInterval + intervalDifference
        timeInterval = timeInterval_I
        
        resume()
    }
    
}

