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
    
    var scrollView = UIScrollView()
    
    var scrollViewItems : [ATextScrollItem] = []
    
    var styled:Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func viewDidAppear(animated: Bool) {
        
        scrollView.setContentOffset(CGPointZero, animated: false)
        
        if !styled {
            
            scrollView.frame = CGRect(origin: CGPoint(x: constraintsView.frame.origin.x, y: 0), size: constraintsView.bounds.size)
            constraintsView.addSubview(scrollView)
            buildStatements()
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
    
    
    static let statements : [String] = ["some say he never closes an if-statement \n\n and that he once baked his laptop",
        "some say he did a photoshoot with the lens cap still on \n\n and that he can find the perfect beach",
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
        
        let nameView = UIImageView(frame: constraintsView.frame)
        nameView.frame.size.height = 75
        nameView.frame.origin.y += 25
        nameView.image = UIImage(named: "rm")
        nameView.contentMode = UIViewContentMode.ScaleAspectFit
        scrollView.addSubview(nameView)
        lastFrame = nameView.frame
        
        for statement in AboutVC.statements {
            
            let scrollItem = ATextScrollItem(containerSize: constraintsView.frame.size, lastFrame: lastFrame)
            scrollItem.label.text = statement
            self.scrollView.addSubview(scrollItem)
            
            lastFrame = scrollItem.frame
            
        }
        
        guard let uwLastFrame = lastFrame else {
            return
        }
        
        let skillView = AImageScrollItem(frame: CGRect(x: 50, y: uwLastFrame.origin.y + uwLastFrame.size.height + 25, width: constraintsView.frame.width - 100, height: constraintsView.frame.width - 100), image: UIImage(named: "skills"))
        self.scrollView.addSubview(skillView)
        
        let badgeView = ABadgeContainer(origin: CGPoint(x: 0, y: skillView.bottomLeft.y), width: constraintsView.frame.size.width)
        self.scrollView.addSubview(badgeView)
        
        if let lastSubview = self.scrollView.subviews.last {
            self.scrollView.contentSize.height = lastSubview.bottomLeft.y + CGFloat(50)
        }
        
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
