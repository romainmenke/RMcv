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
    
    var counter : Int = 0
    var maxCounter : Int = 0
    
    var eventArt : EventArt = EventArt.army()
    
    init(frame: CGRect, animation: EventArt) {
        
        self.timer = NSTimer()
        
        super.init(frame: frame, textContainer: nil)
        
        self.eventArt = animation
        self.maxCounter = eventArt.fullString.characters.count
        
        self.text = eventArt.fullString
        self.editable = false
        self.selectable = false
        self.scrollEnabled = false

        self.textColor = PyramidOfDoomVC.darkSandColor()
        self.clipsToBounds = false
        self.backgroundColor = UIColor.clearColor()
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func start() {
        
        timer = NSTimer.scheduledTimerWithTimeInterval(0.1, target: self, selector: Selector("eventAnimation"), userInfo: nil, repeats: true)
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
    
    
    func eventAnimation() {
        if self.eventArt.forwards {
            self.text = moveStringForward(self.text)
        } else {
            self.text = moveStringBackwards(self.text)
        }
    }
    
}