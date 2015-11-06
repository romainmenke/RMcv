//
//  Choice.swift
//  CV
//
//  Created by Romain Menke on 04/11/15.
//  Copyright © 2015 Romain Menke. All rights reserved.
//

import UIKit


class ChoicePresenter : UIView {
    
    
    var leftButton : UIButton
    var rightButton : UIButton
    
    var choiceLabel : UILabel
    
    var choice : Choice
    
    var delegate : ChoiceDelegate?
    
    let darkSandColor = UIColor(red: 0.7, green: 0.5, blue: 0.2, alpha: 1.0)
    let sandColor = UIColor(red: 1.0, green: 0.9, blue: 0.4, alpha: 1.0)
    
    init(containerSize cSize: CGSize) {
        
        let xMargin = (cSize.width - 250) / 2
        let yMargin = (cSize.height - 180)
        let frame = CGRect(x: xMargin, y: yMargin, width: 250, height: 100)
        
        choice = Choice.randomChoice()
        
        leftButton = UIButton(frame: CGRect(x: 0, y: 50, width: 125, height: 50))
        rightButton = UIButton(frame: CGRect(x: 125, y: 50, width: 125, height: 50))
        choiceLabel = UILabel(frame: CGRect(x: 0, y: 0, width: 250, height: 50))
        
        choiceLabel.text = choice.title
        leftButton.setTitle(choice.left, forState: .Normal)
        rightButton.setTitle(choice.right, forState: .Normal)
        
        choiceLabel.textColor = sandColor
        leftButton.setTitleColor(sandColor, forState: .Normal)
        rightButton.setTitleColor(sandColor, forState: .Normal)
        
        
        choiceLabel.textAlignment = NSTextAlignment.Center
        
        choiceLabel.font = UIFont(name: choiceLabel.font!.fontName, size: UIFont.systemFontSize() - 1)
        leftButton.titleLabel!.font = UIFont(name: choiceLabel.font!.fontName, size: UIFont.systemFontSize() - 4)
        rightButton.titleLabel!.font = UIFont(name: choiceLabel.font!.fontName, size: UIFont.systemFontSize() - 4)
        
        choiceLabel.layer.borderColor = darkSandColor.CGColor
        choiceLabel.layer.borderWidth = 0.5
        
        leftButton.layer.borderColor = darkSandColor.CGColor
        leftButton.layer.borderWidth = 0.5
        
        rightButton.layer.borderColor = darkSandColor.CGColor
        rightButton.layer.borderWidth = 0.5
        
        super.init(frame: frame)
        
        self.layer.cornerRadius = 25
        self.clipsToBounds = true
        self.backgroundColor = UIColor.blackColor()
        
        self.addSubview(leftButton)
        self.addSubview(rightButton)
        self.addSubview(choiceLabel)
        
        leftButton.addTarget(self, action: Selector("leftClick"), forControlEvents: UIControlEvents.TouchUpInside)
        rightButton.addTarget(self, action: Selector("rightClick"), forControlEvents: UIControlEvents.TouchUpInside)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func leftClick() {
        guard let del = self.delegate else {
            return
        }
        del.theChoseOne(choice.leftResult, animation: choice.leftAnimation)
    }
    
    func rightClick() {
        guard let del = self.delegate else {
            return
        }
        del.theChoseOne(choice.rightResult, animation: choice.rightAnimation)
    }
    
}


protocol ChoiceDelegate {
    
    func theChoseOne(statsMod: Stats, animation: EventArt?)
    
}