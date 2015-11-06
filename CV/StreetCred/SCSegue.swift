//
//  SCSegue.swift
//  CV
//
//  Created by Romain Menke on 06/11/15.
//  Copyright © 2015 Romain Menke. All rights reserved.
//

import UIKit


extension StreetCredVC {
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        // make sure we have not make a spelling mistake
        if segue.identifier == "toWebsite" {
            
            // unwrap navigation controller and destination
            guard let navVC = segue.destinationViewController as? UINavigationController, let segueVC = navVC.viewControllers.first as? WebVC else {
                return
            }
            
            
            // switch the value set by the button press
            switch selectedVC {
               
            // set the corresponding value in the WebViewController
            
            case 0 :
                segueVC.navTitle = "Web"
                segueVC.address = "http://romainmenke.com"
            case 1 :
                segueVC.navTitle = "GitHub"
                segueVC.address = "https://github.com/romainmenke"
            case 2 :
                segueVC.navTitle = "StackOverflow"
                segueVC.address = "https://stackoverflow.com/users/4263818/r-menke?tab=profile"
            default :
                segueVC.navTitle = "StackOverflow"
                segueVC.address = "http://romainmenke.com"
                return
                
            }
        }
    }
    // too many closing brases
}