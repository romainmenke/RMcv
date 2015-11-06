//
//  StreetCredVC.swift
//  CV
//
//  Created by Romain Menke on 04/11/15.
//  Copyright © 2015 Romain Menke. All rights reserved.
//

// Extension : SCSegue -> prepareForSegue -> switch pressed button, send url & title
// Extension : SCButtons -> init / styling / targets / animations for the buttons

import UIKit

class StreetCredVC: UIViewController {

    var selectedVC : Int = 0
    
    var gButton : UIButton!
    var sButton : UIButton!
    var pButton : UIButton!
    
    var rH : CGFloat = 0
    var rW : CGFloat = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // setup percentage based size system
        rH = view.frame.height / 100
        rW = view.frame.width / 100
        
        // init buttons
        createButtons()
        
        // add buttons
        view.addSubview(gButton)
        view.addSubview(pButton)
        view.addSubview(sButton)
        
        // style self
        view.backgroundColor = UIColor.whiteColor()
        
        
    }
    
    override func viewDidDisappear(animated: Bool) {
        // reset to default conditions
        resetButtons()
        
    }
    
    override func viewDidAppear(animated: Bool) {
        // do funky stuff
        animateButtonsToCenter()
        
    }
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    override func prefersStatusBarHidden() -> Bool {
        return true
    }
    
}

