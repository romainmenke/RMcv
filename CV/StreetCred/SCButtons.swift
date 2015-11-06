//
//  SCButtons.swift
//  CV
//
//  Created by Romain Menke on 06/11/15.
//  Copyright © 2015 Romain Menke. All rights reserved.
//

import UIKit


extension StreetCredVC {
    
    /**
     Initialises the buttons and adds Targets
     
     This method holds the setup that has to happen in viewDidLoad.
     */
    func createButtons() {
        // website button
        pButton = UIButton(frame: CGRect(x: 20 * self.rW, y: -200, width: 30 * self.rW, height: 30 * self.rW))
        pButton.addTarget(self, action: Selector("pPress"), forControlEvents: .TouchUpInside)
        styleButton(pButton,title: "W")
        
        // git hub button
        gButton = UIButton(frame: CGRect(x: -200 * self.rW, y: 50 * self.rH, width: 30 * self.rW, height: 30 * self.rW))
        gButton.addTarget(self, action: Selector("gPress"), forControlEvents: .TouchUpInside)
        styleButton(gButton,title: "G")
        
        // stack overflow buttom
        sButton = UIButton(frame: CGRect(x: self.view.frame.width + 100, y: self.view.frame.height + 100, width: 30 * self.rW, height: 30 * self.rW))
        sButton.addTarget(self, action: Selector("sPress"), forControlEvents: .TouchUpInside)
        styleButton(sButton,title: "SO")
        
    }
    
    /**
     Give a button the basic styling
     */
    func styleButton(button: UIButton, title:String) {
        
        button.backgroundColor = UIColor.whiteColor()
        button.layer.cornerRadius = button.frame.width / 2
        button.setTitleColor(UIColor.blackColor(), forState: .Normal)
        button.setTitle(title, forState: .Normal)
        button.titleLabel!.font = UIFont(name: button.titleLabel!.font.fontName, size: 25)
        button.layer.borderColor = UIColor.blackColor().CGColor
        button.layer.borderWidth = 3
        
    }
    
    func pPress() {
        selectedVC = 0
        blowUpButton(pButton)
    }
    func gPress() {
        selectedVC = 1
        blowUpButton(gButton)
    }
    func sPress() {
        selectedVC = 2
        blowUpButton(sButton)
    }
    
    /**
     Transition animation for segue to next view
     */
    func blowUpButton(button:UIButton) {
        
        
        UIView.animateWithDuration(1.0, animations: { () -> Void in
            
            switch self.selectedVC {
                
            case 0 :
                self.gButton.frame = CGRect(x: -1000 * self.rW, y: 50 * self.rH, width: 30 * self.rW, height: 30 * self.rW)
                self.sButton.frame = CGRect(x: self.view.frame.width + 1000, y: self.view.frame.height + 1000, width: 30 * self.rW, height: 30 * self.rW)
                
            case 1 :
                self.pButton.frame = CGRect(x: 20 * self.rW, y: -1000, width: 30 * self.rW, height: 30 * self.rW)
                self.sButton.frame = CGRect(x: self.view.frame.width + 1000, y: self.view.frame.height + 1000, width: 30 * self.rW, height: 30 * self.rW)
                
                
            case 2 :
                self.gButton.frame = CGRect(x: -1000 * self.rW, y: 50 * self.rH, width: 30 * self.rW, height: 30 * self.rW)
                self.pButton.frame = CGRect(x: 20 * self.rW, y: -1000, width: 30 * self.rW, height: 30 * self.rW)
                
            default :
                return
            }
            
            button.frame.size = CGSize(width: self.view.frame.width * 3, height: self.view.frame.height * 3)
            button.frame.origin = CGPoint(x: -self.view.frame.width, y: -self.view.frame.height)
            
            }) { (animated) -> Void in
                
                
                
        }
        
        UIView.animateWithDuration(0.7, delay: 0.1, options: [], animations: { () -> Void in
            button.alpha = 0.0
            }) { (animated) -> Void in
                self.performSegueWithIdentifier("toWebsite", sender: self)
        }
    }
    
    /**
     Transition animation for viewdDidAppear
     */
    func animateButtonsToCenter() {
        
        UIView.animateWithDuration(1.0) { () -> Void in
            self.pButton.frame = CGRect(x: 20 * self.rW, y: 25 * self.rH, width: 30 * self.rW, height: 30 * self.rW)
            self.gButton.frame = CGRect(x: 25 * self.rW, y: 50 * self.rH, width: 30 * self.rW, height: 30 * self.rW)
            self.sButton.frame = CGRect(x: 55 * self.rW, y: 35 * self.rH, width: 30 * self.rW, height: 30 * self.rW)
        }
        
    }
    
    /**
     Reset in viewDidDisappear to prepare for viewDidAppear
     */
    func resetButtons() {
        
        self.pButton.frame = CGRect(x: 20 * self.rW, y: -200, width: 30 * self.rW, height: 30 * self.rW)
        self.pButton.alpha = 1
        self.gButton.frame = CGRect(x: -200 * self.rW, y: 50 * self.rH, width: 30 * self.rW, height: 30 * self.rW)
        self.gButton.alpha = 1
        self.sButton.frame = CGRect(x: self.view.frame.width + 100, y: self.view.frame.height + 100, width: 30 * self.rW, height: 30 * self.rW)
        self.sButton.alpha = 1
    }
    
}