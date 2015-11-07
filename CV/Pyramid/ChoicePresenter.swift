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
        
        // get an event
        choice = Choice.randomChoice()
        
        // init buttons
        leftButton = UIButton(frame: CGRect(x: 0, y: 50, width: 125, height: 50))
        rightButton = UIButton(frame: CGRect(x: 125, y: 50, width: 125, height: 50))
        choiceLabel = UILabel(frame: CGRect(x: 0, y: 0, width: 250, height: 50))
        
        // init super
        super.init(frame: frame)
        
        // style buttons
        styleButton(leftButton, title: choice.left)
        styleButton(rightButton, title: choice.right)
        
        // add targets
        leftButton.addTarget(self, action: Selector("leftClick"), forControlEvents: UIControlEvents.TouchUpInside)
        rightButton.addTarget(self, action: Selector("rightClick"), forControlEvents: UIControlEvents.TouchUpInside)
        
        // style label
        styleLabel(choiceLabel, title: choice.title)
        
        // style self
        style()
        
        // add subviews
        self.addSubview(leftButton)
        self.addSubview(rightButton)
        self.addSubview(choiceLabel)
        
        
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}



// delegate for CP
protocol ChoiceDelegate {
    
    /**
     Delegate function to handle button click
     
     This method is triggered by button clicks in the ChoicePresenter. Use it to send stats and start event animation
     */
    func theChoseOne(statsMod: Stats, animation: EventArt?)
    
}

