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
    
    var currentColoredRange : NSRange = NSRange(location: 0, length: 0)
    
    let pyramidArt : NSString = "          , /`.\n        ,' / __`.\n      ,'_/_  _ _`.\n    ,'_ /_ ___ _ `.\n  ,'_  /___ __ _ _`.\n '-.._/___...-'-.-..__`."
    
    init(frame: CGRect) {
        
        super.init(frame: frame, textContainer: nil)
        
        self.editable = false
        self.selectable = false
        self.scrollEnabled = false
        
        self.text = pyramidArt as String
        self.textColor = PyramidOfDoomVC.sandColor()
        self.backgroundColor = PyramidOfDoomVC.sandColor()
        
        
        let stringRange = pyramidArt.rangeOfString(pyramidArt as String)
        self.currentColoredRange = NSRange(location: stringRange.length - 1, length: 1)
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    
    func colorRangeOfString(string: String, range:NSRange) -> NSAttributedString {
        
        let attrString: NSMutableAttributedString = NSMutableAttributedString(string: string)
        attrString.addAttribute(NSForegroundColorAttributeName, value: PyramidOfDoomVC.darkSandColor(), range: range)
        attrString.addAttribute(NSForegroundColorAttributeName, value: PyramidOfDoomVC.sandColor(), range: NSRange(location: 0, length: range.location))
        
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
            
            if let del = builderDelegate {
                del.buildingComplete()
            }
        }
        
        return colorRangeOfString(string, range: range)
        
    }
    
    func build() {
        attributedText = reverseOrderColor(&self.currentColoredRange, string: self.pyramidArt as String)
    }

    
}


protocol PyramidDelegate : class {
    
    func buildingComplete()
    
}
