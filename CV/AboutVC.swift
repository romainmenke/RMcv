//
//  FirstViewController.swift
//  CV
//
//  Created by Romain Menke on 04/11/15.
//  Copyright © 2015 Romain Menke. All rights reserved.
//

import UIKit

class AboutVC: UIViewController {
    
    @IBOutlet weak var constraintsView: UIView!
    
    var scrollView = AboutScroller()
    
    var scrollViewItems : [ATextScrollItem] = []
    
    var styled:Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func viewDidAppear(animated: Bool) {
        
        scrollView.setContentOffset(CGPointZero, animated: false)
        
        if !styled {
            
            scrollView = AboutScroller(frame: constraintsView.frame)
            self.view.addSubview(scrollView)
            styled = true
            
        }
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func prefersStatusBarHidden() -> Bool {
        return true
    }
}


