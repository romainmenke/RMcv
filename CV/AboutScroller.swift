//
//  AboutScroller.swift
//  CV
//
//  Created by Romain Menke on 09/11/15.
//  Copyright © 2015 Romain Menke. All rights reserved.
//

import UIKit

// just a container for the static design

class AboutScroller: UIScrollView {
    
    
    override init(frame: CGRect) {
        
        super.init(frame: frame)
        
        // get content
        let iconView = icon()
        let infoViews = info()
        let graphView = graph()
        let badgeView = badge()
        
        // Y-offset
        var runningY : CGFloat = 25
        
        // icon
        iconView.frame.origin.y = runningY
        runningY += iconView.frame.size.height + 10
        self.addSubview(iconView)
        
        
        // info
        for i in 0..<infoViews.count {
            
            let infoView = infoViews[i]
            infoView.frame.origin.y = runningY
            runningY += infoView.frame.size.height
            self.addSubview(infoView)
            
        }
        
        runningY += 25
        
        // graph
        graphView.frame.origin.y = runningY
        runningY += graphView.frame.size.height + 25
        self.addSubview(graphView)
        
        badgeView.frame.origin.y = runningY
        runningY += badgeView.frame.size.height + 25
        self.addSubview(badgeView)
        
        self.contentSize.height = runningY
        
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
    func icon() -> UIView {
        
        let iconView = UIImageView(frame: CGRectZero)
        iconView.frame.size.width = self.frame.size.width
        iconView.frame.size.height = 75
        iconView.frame.origin.y += 25
        iconView.image = UIImage(named: "rm")
        iconView.contentMode = UIViewContentMode.ScaleAspectFit
        return iconView
        
    }
    
    func info() -> [UIView] {
        
        let statements : [String] = ["some say he never closes an if-statement \n\n and that he once baked his macbook",
            "some say he did a photoshoot with the lens cap still on \n\n and that he can find the perfect beach",
            "some say he once passed an argument as a value \n\n and that he is still trying to build a robot friend",
            "some say his parallel processing is unparalled \n\n and that he ate sushi on 4 continents",
            "some say his naming is unusual \n\n and that he rotated a sailing boat along it's Y-axis",
            "some say his objectivity can lose structural integrity \n\n and that his favorite food is coffee",
            "some say he declared the dishes as an optional \n\n and that his jokes aren't really funny",
            "some say he once created a finite loop \n\n and that he did start the flame war on SO"]
        
        var views : [UIView] = []
        
        for i in 0..<statements.count {
            
            let statement = statements[i]
            
            let scrollItem = ATextScrollItem(containerSize: self.frame.size)
            scrollItem.label.text = statement
            if i == (statements.count - 1) {
                scrollItem.border.backgroundColor = UIColor.clearColor()
            }

            views.append(scrollItem)
            
        }
        
        return views
        
    }
    
    func graph() -> UIView {
        
        return AImageScrollItem(frame: CGRect(x: 50, y: 0, width: self.frame.size.width - 100, height: self.frame.size.width - 100), image: UIImage(named: "skills"))
        
    }
    
    func badge() -> UIView {
        
        return ABadgeContainer(origin: CGPoint(x: 0, y: 0), width: self.frame.size.width)
        
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


