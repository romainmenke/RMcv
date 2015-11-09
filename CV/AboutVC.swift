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
        // Dispose of any resources that can be recreated.
    }
    
    override func prefersStatusBarHidden() -> Bool {
        return true
    }
    
    
    
    
}




// some say he never closes an if-statement
// and that he once baked his laptop

// some say he once did an entire photoshoot with the lens cap still on
// and that he can find the perfect beach

// some say he once passed an argument as a value
// and that he is still trying to build a robot friend

// some say his parallel processing is unparalled
// and that he ate sushi on 4 continents

// some say his naming is unusual
// and that he rotated a sailing boat along it's Y-axis

// some say his objectivity can lose structural integrity
// and that his favorite food is coffee

// some say he declared the dishes as an optional
// and that his jokes aren't really funny

// some say he once created a finite loop
// and that he did start the flame war on SO

// some say he omitted something here because it was too lame
