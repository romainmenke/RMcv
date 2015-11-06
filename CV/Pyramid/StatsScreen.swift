//
//  StatsScreen.swift
//  CV
//
//  Created by Romain Menke on 05/11/15.
//  Copyright © 2015 Romain Menke. All rights reserved.
//

import UIKit


class StatsScreen : UIView {
    
    var slaves : UILabel
    var rebels : UILabel
    var food : UILabel
    var cats : UILabel
    
    var yearsLeft : UILabel
    
    let font = UIFont(name: "Courier-Bold", size: UIFont.systemFontSize() - 3)
    
    override init(frame: CGRect) {
        
        slaves = UILabel(frame: CGRect(x: 15, y: 15, width: 100, height: 10))
        rebels = UILabel(frame: CGRect(x: 15, y: 35, width: 100, height: 10))
        food = UILabel(frame: CGRect(x: 15, y: 55, width: 100, height: 10))
        cats = UILabel(frame: CGRect(x: 15, y: 75, width: 100, height: 10))
        yearsLeft = UILabel(frame: CGRect(x: frame.width - 115, y: 15, width: 100, height: 10))
        
        super.init(frame: frame)
        
        yearsLeft.textAlignment = NSTextAlignment.Right
        
        styleLabel(slaves, font: self.font, title: "slaves: ")
        styleLabel(rebels, font: self.font, title: "rebels: ")
        styleLabel(food, font: self.font, title: "food: ")
        styleLabel(cats, font: self.font, title: "cats: ")
        styleLabel(yearsLeft, font: self.font, title: "life: ")
        
        self.backgroundColor = UIColor.clearColor()
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}

extension StatsScreen {
    
    func styleLabel(label:UILabel, font:UIFont?,title:String) {
        label.backgroundColor = UIColor.clearColor()
        label.font = font
        label.text = title
        self.addSubview(label)
    }
}


extension StatsScreen {
    
    func updateStats(stats: Stats) {
        
        slaves.text = "slaves: " + "\(stats.slaves)"
        rebels.text = "rebels: " + "\(stats.rebels)"
        food.text = "food: " + "\(stats.food)"
        cats.text = "cats: " + "\(stats.cats)"
        yearsLeft.text = "life: " + "\(stats.yearsLeft)"
        
    }
    
}
