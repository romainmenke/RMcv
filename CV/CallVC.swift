//
//  PhoneVC.swift
//  CV
//
//  Created by Romain Menke on 07/11/15.
//  Copyright © 2015 Romain Menke. All rights reserved.
//

import UIKit

class CallVC: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(animated: Bool) {
        call()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prefersStatusBarHidden() -> Bool {
        return true
    }
    
}
