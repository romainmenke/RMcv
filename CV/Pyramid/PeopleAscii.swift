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
    
    let stone = "\u{25A0}"
    var peopleArt : String
    
    init(frame: CGRect) {
        
        peopleArt = "\(stone),,,,,,,,,                                   "
        
        super.init(frame: frame, textContainer: nil)
        
        self.editable = false
        self.selectable = false
        self.scrollEnabled = false
        
        self.text = peopleArt
        self.textColor = PyramidOfDoomVC.darkSandColor()
        self.clipsToBounds = false
        self.backgroundColor = UIColor.clearColor()
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    
    func moveStringForward(string:String) -> String {
        let tail = string.substringToIndex(string.endIndex.predecessor())
        let head = string.substringFromIndex(string.endIndex.predecessor())
        
        return head + tail
    }

    
    func movePeople() {
        self.text = moveStringForward(self.text)
    }
    
}