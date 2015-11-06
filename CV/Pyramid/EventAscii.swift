//
//  BarbariansAscii.swift
//  CV
//
//  Created by Romain Menke on 05/11/15.
//  Copyright © 2015 Romain Menke. All rights reserved.
//

import Foundation

import UIKit


class EventAscii: UITextView {
    
    var timer : NSTimer
    
    let sandColor = UIColor(red: 1.0, green: 0.9, blue: 0.4, alpha: 1.0)
    let darkSandColor = UIColor(red: 0.7, green: 0.5, blue: 0.2, alpha: 1.0)
    
    var counter : Int = 0
    var maxCounter : Int = 0
    
    var eventArt : EventArt = EventArt.army
    
    init(frame: CGRect, animation: EventArt) {
        
        self.timer = NSTimer()
        
        super.init(frame: frame, textContainer: nil)
        
        self.eventArt = animation
        self.maxCounter = eventArt.fullString.characters.count
        
        self.text = eventArt.fullString
        self.editable = false
        self.selectable = false
        self.scrollEnabled = false

        self.textColor = darkSandColor
        self.clipsToBounds = false
        self.backgroundColor = UIColor.clearColor()
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func start() {
        
        timer = NSTimer.scheduledTimerWithTimeInterval(0.1, target: self, selector: Selector("loopMove"), userInfo: nil, repeats: true)
    }
    
    func stop() {
        timer.invalidate()
        self.removeFromSuperview()
    }
    
    func moveStringForward(string:String) -> String {
        
        counter += 1
        if counter >= maxCounter {
            self.stop()
        }
        
        let tail = string.substringToIndex(string.endIndex.predecessor())
        let head = string.substringFromIndex(string.endIndex.predecessor())
        
        return head + tail
    }
    
    func moveStringBackwards(string:String) -> String {
        
        counter += 1
        if counter >= maxCounter - eventArt.eventString.characters.count {
            self.stop()
        }
        
        let tail = string.substringToIndex(string.startIndex.successor())
        let head = string.substringFromIndex(string.startIndex.successor())
        
        return head + tail
    }
    
    
    func loopMove() {
        if self.eventArt.forwards {
            self.text = moveStringForward(self.text)
        } else {
            self.text = moveStringBackwards(self.text)
        }
    }
    
}