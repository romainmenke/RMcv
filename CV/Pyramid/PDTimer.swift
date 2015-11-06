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
    
    
    init(timeInterval timeInterval_I : NSTimeInterval, selector selector_I:() -> (), repeats repeats_I: Bool) {
        
        timeInterval = timeInterval_I
        repeats = repeats_I
        selector = selector_I
        
        super.init()
        
    }
    
}

extension PDTimer {
    
    private func invalidateTimers() {
        
        if let uwTimer = timer {
            uwTimer.invalidate()
        }
        
        if let uwResumeTimer = resumeTimer {
            uwResumeTimer.invalidate()
        }
        
    }
}


extension PDTimer {
    
    internal func start() {
        startTimer(timerInterval: timeInterval)
        paused = false
    }
    
    private func startTimer(timerInterval timerInterval_I:NSTimeInterval) {
        lastShot = NSDate()
        timer = NSTimer(timeInterval: timerInterval_I, target: self, selector: Selector("fire"), userInfo: nil, repeats: repeats)
    }
    
    internal func fire() {
        lastShot = NSDate()
        selector()
    }
}


extension PDTimer {
    
    internal func pause() {
        
        invalidateTimers()
        
        guard let uwLastShot = lastShot else {
            return
        }
        
        if !paused {
            resumeTimeInterval = NSDate().timeIntervalSinceDate(uwLastShot)
        }
        
        paused = true
        
    }
    
    private func resume() {
        
        paused = false
        guard let uwResumeTimeInterval = resumeTimeInterval else {
            return
        }
        
        resumeTimer = NSTimer(timeInterval: uwResumeTimeInterval, target: self, selector: Selector("executeOnceAndResume"), userInfo: nil, repeats: false)
    }
    
    internal func executeOnceAndResume() {
        lastShot = NSDate()
        selector()
        start()
        
    }
}

