//
//  SlavesAscii.swift
//  CV
//
//  Created by Romain Menke on 05/11/15.
//  Copyright © 2015 Romain Menke. All rights reserved.
//

import Foundation
import UIKit


class PyramidAscii: UITextView {
    
    weak var builderDelegate : PyramidDelegate?
    
    var timer : NSTimer
    
    let sandColor = UIColor(red: 1.0, green: 0.9, blue: 0.4, alpha: 1.0)
    let darkSandColor = UIColor(red: 0.7, green: 0.5, blue: 0.2, alpha: 1.0)
    
    var currentColoredRange : NSRange = NSRange(location: 0, length: 0)
    
    let pyramidArt : NSString = "          , /`.\n        ,' / __`.\n      ,'_/_  _ _`.\n    ,'_ /_ ___ _ `.\n  ,'_  /___ __ _ _`.\n '-.._/___...-'-.-..__`."
    
    init(frame: CGRect) {
        
        self.timer = NSTimer()
        
        super.init(frame: frame, textContainer: nil)
        
        self.editable = false
        self.selectable = false
        self.scrollEnabled = false
        
        self.text = pyramidArt as String
        self.textColor = sandColor
        self.backgroundColor = sandColor
        
        let stringRange = pyramidArt.rangeOfString(pyramidArt as String)
        self.currentColoredRange = NSRange(location: stringRange.length - 1, length: 1)
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func start() {
        timer = NSTimer.scheduledTimerWithTimeInterval(1.0, target: self, selector: Selector("loopColor"), userInfo: nil, repeats: true)
    }
    
    func stop() {
        timer.invalidate()
    }
    
    func colorRangeOfString(string: String, range:NSRange) -> NSAttributedString {
        
        let attrString: NSMutableAttributedString = NSMutableAttributedString(string: string)
        attrString.addAttribute(NSForegroundColorAttributeName, value: self.darkSandColor, range: range)
        attrString.addAttribute(NSForegroundColorAttributeName, value: self.sandColor, range: NSRange(location: 0, length: range.location))
        
        return attrString
        
    }
    
    func reverseOrderColor(inout range: NSRange, string: String) -> NSAttributedString {
        
        if range.location <= 0 {
            return colorRangeOfString(string, range: pyramidArt.rangeOfString(pyramidArt as String))
        }
        
        range.location -= 1
        range.length += 1
        
        while String((string as NSString).substringWithRange(NSRange(location: range.location, length: 1))) == " " {
            range.location -= 1
            range.length += 1
            if range.location == 0 {
                break
            }
        }
        
        if range.location <= 0 {
            
            stop()
            
            if let del = builderDelegate {
                del.buildingComplete()
            }
        }
        
        return colorRangeOfString(string, range: range)
        
    }
    
    func loopColor() {
        attributedText = reverseOrderColor(&self.currentColoredRange, string: self.pyramidArt as String)
    }
    
    func build() {
        loopColor()
    }
    
}


protocol PyramidDelegate : class {
    
    func buildingComplete()
    
}
