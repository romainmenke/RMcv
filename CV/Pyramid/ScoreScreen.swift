//
//  ScoreScreen.swift
//  CV
//
//  Created by Romain Menke on 07/11/15.
//  Copyright © 2015 Romain Menke. All rights reserved.
//

import UIKit


class ScoreScreen : UIView, UIGestureRecognizerDelegate {
    
    var resultLabel : UITextView
    var delegate : ScoreScreenDelegate?

    let font = UIFont(name: "Courier-Bold", size: UIFont.systemFontSize())
    
    init(containerSize: CGSize, stats: Stats) {
        
        let frame = CGRect(origin: CGPointZero, size: containerSize)
        
        
        resultLabel = UITextView(frame: CGRect(x: 25, y: 50, width: containerSize.width - 50, height: containerSize.height - 50))
        
        super.init(frame: frame)
        
        resultLabel.textAlignment = NSTextAlignment.Center
        resultLabel.backgroundColor = UIColor.clearColor()
        resultLabel.font = font
        resultLabel.editable = false
        resultLabel.selectable = false
        resultLabel.text = generateResultText(stats)
        
        self.addSubview(resultLabel)
        self.backgroundColor = PyramidOfDoomVC.sandColor()
        
        let tap = UITapGestureRecognizer(target: self, action: Selector("tapped"))
        tap.delegate = self
        self.addGestureRecognizer(tap)
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func tapped() {
        
        print("tapped")
        guard let del = self.delegate else {
            return
        }
        del.dismissScoreScreen()
        
    }
}


extension ScoreScreen {
    
    func generateResultText(stats:Stats) -> String {
        
        if stats.yearsLeft > 0 {
        
            return "\(stats.yearsLeft) years before you died you completed your Great Pyramid.\n\n\(stats.slaves) slaves worked to complete your greatest and final achievement.\n\nYour \(stats.guards) guards and your \(stats.followers) most devoted followers will be buried with you when the time comes.\n\nAfter which your palace will become home only to your \(stats.cats) cats.\n\nA highscore of \(stats.score.gameScore) will be carved at the entrance of \nthe Great Pyramid of Doom"
            
        } else {
            
            return "You failed to finish your Pyramid.\n\nThe \(stats.rebels) rebels succeeded in disrupting your reign.\n\nYour \(stats.guards) guards and your \(stats.followers) followers were quick to denounce you.\n\nYour \(stats.cats) cats did remain faithful to you until your \(stats.food) cans of tuna ran out.\n\nA highscore of \(stats.score.gameScore) will be quickly eroded by the sands"
            
        }
    }
}


protocol ScoreScreenDelegate{
    
    func dismissScoreScreen()
    
}

