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

extension PDTimer {
    
    internal func invalidate() {
        
        if let uwTimer = timer {
            uwTimer.invalidate()
        }
        
        if let uwResumeTimer = resumeTimer {
            uwResumeTimer.invalidate()
        }
        
        running = false
        timer = nil
        resumeTimer = nil
        
    }
}


extension PDTimer {
    
    internal func start() {
        if !running {
            startTimer(timerInterval: timeInterval)
            paused = false
            running = true
        }
    }
    
    func startTimer(timerInterval timerInterval_I:NSTimeInterval) {
        lastShot = NSDate()
        timer = NSTimer.scheduledTimerWithTimeInterval(timerInterval_I, target: self, selector: Selector("fire"), userInfo: nil, repeats: repeats)
    }
    
    func fire() {
        lastShot = NSDate()
        selector()
    }
}


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
        
    }
    
    internal func resume() {
        
        paused = false
        guard let uwResumeTimeInterval = resumeTimeInterval else {
            return
        }
        
        resumeTimer = NSTimer.scheduledTimerWithTimeInterval(uwResumeTimeInterval, target: self, selector: Selector("executeOnceAndResume"), userInfo: nil, repeats: false)
    }
    
    internal func executeOnceAndResume() {
        lastShot = NSDate()
        selector()
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

