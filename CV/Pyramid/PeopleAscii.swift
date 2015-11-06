//
//  PyramidAscii.swift
//  CV
//
//  Created by Romain Menke on 05/11/15.
//  Copyright © 2015 Romain Menke. All rights reserved.
//

import Foundation
import UIKit


class PeopleAscii: UITextView {
    
    var timer : NSTimer
    
    let sandColor = UIColor(red: 1.0, green: 0.9, blue: 0.4, alpha: 1.0)
    let darkSandColor = UIColor(red: 0.7, green: 0.5, blue: 0.2, alpha: 1.0)
    
    let stone = "\u{25A0}"
    var peopleArt : String
    
    init(frame: CGRect) {
        
        self.timer = NSTimer()
        peopleArt = "\(stone),,,,,,,,,                                   "
        
        super.init(frame: frame, textContainer: nil)
        
        self.editable = false
        self.selectable = false
        self.scrollEnabled = false
        
        self.text = peopleArt
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
    }
    
    func moveStringForward(string:String) -> String {
        let tail = string.substringToIndex(string.endIndex.predecessor())
        let head = string.substringFromIndex(string.endIndex.predecessor())
        
        return head + tail
    }

    
    func loopMove() {
        self.text = moveStringForward(self.text)
    }
    
}