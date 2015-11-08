//
//  FirstViewController.swift
//  CV
//
//  Created by Romain Menke on 04/11/15.
//  Copyright © 2015 Romain Menke. All rights reserved.
//

import UIKit

class AboutVC: UIViewController {

    var scrollView = UIScrollView()
    let numberOfItems : CGFloat = 10
    
    var scrollViewItems : [AScrollItem] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        scrollView.frame = self.view.frame
        scrollView.contentSize = CGSize(width: self.view.frame.size.width, height: 100 * numberOfItems)
        
        self.view.addSubview(scrollView)
        
        buildStatements()
        
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func prefersStatusBarHidden() -> Bool {
        return true
    }
    
    
    static let statements : [String] = ["some say he never closes an if-statement \n\n and that he once baked his laptop",
        "some say he never closes an if-statement \n\n and that he once baked his laptop",
        "some say he once did photoshoot with the lens cap still on \n\n and that he can find the perfect beach",
        "some say he once passed an argument as a value \n\n and that he is still trying to build a robot friend",
        "some say his parallel processing is unparalled \n\n and that he ate sushi on 4 continents",
        "some say his naming is unusual \n\n and that he rotated a sailing boat along it's Y-axis",
        "some say his objectivity can lose structural integrity \n\n and that his favorite food is coffee",
        "some say he declared the dishes as an optional \n\n and that his jokes aren't really funny",
        "some say he once created a finite loop \n\n and that he did start the flame war on SO"]

}


extension AboutVC {
    
    func buildStatements() {
        
        var lastFrame : CGRect?
        
        for statement in AboutVC.statements {
            
            let scrollItem = AScrollItem(containerSize: self.view.frame.size, lastFrame: lastFrame)
            scrollItem.label.text = statement
            self.scrollView.addSubview(scrollItem)
            
            lastFrame = scrollItem.frame
            
        }
    }
}


