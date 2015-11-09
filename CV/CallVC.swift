//
//  PhoneVC.swift
//  CV
//
//  Created by Romain Menke on 07/11/15.
//  Copyright © 2015 Romain Menke. All rights reserved.
//

import UIKit

class CallVC: UIViewController {
    
    var calling : Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    
    override func viewDidAppear(animated: Bool) {
        if !calling {
            call()
            calling = true
        } else {
            
            calling = false
            
            guard let window = UIApplication.sharedApplication().windows.first, let tabBar = window.rootViewController as? UITabBarController else {
                return
            }
        
            tabBar.selectedIndex = 0
        }
        
    }

    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prefersStatusBarHidden() -> Bool {
        return true
    }
    
}
