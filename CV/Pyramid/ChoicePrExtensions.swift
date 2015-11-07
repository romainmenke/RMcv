//
//  ChoicePextensions.swift
//  CV
//
//  Created by Romain Menke on 06/11/15.
//  Copyright © 2015 Romain Menke. All rights reserved.
//

import UIKit


// basic style for CP
extension ChoicePresenter {
    
    func style() {
        self.layer.cornerRadius = 25
        self.clipsToBounds = true
        self.backgroundColor = UIColor.blackColor()
    }
}


// style for CP Label
extension ChoicePresenter {
    
    func styleLabel(label:UILabel, title:String) {
        
        label.text = title
        label.textColor = sandColor
        label.textAlignment = NSTextAlignment.Center
        label.font = UIFont(name: label.font!.fontName, size: UIFont.systemFontSize() - 1)
        label.layer.borderColor = darkSandColor.CGColor
        label.layer.borderWidth = 0.5
        
    }
    
}

// style and target functions for CP Buttons
extension ChoicePresenter {
    
    func styleButton(button:UIButton, title:String) {
        
        button.setTitle(title, forState: .Normal)
        button.setTitleColor(sandColor, forState: .Normal)
        button.layer.borderColor = darkSandColor.CGColor
        button.layer.borderWidth = 0.5
        
        guard let titleLabel = button.titleLabel, let font = titleLabel.font else {
            return
        }
        
        titleLabel.font = UIFont(name: font.fontName, size: UIFont.systemFontSize() - 4)
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