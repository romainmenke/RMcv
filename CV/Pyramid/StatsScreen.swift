//
//  StatsScreen.swift
//  CV
//
//  Created by Romain Menke on 05/11/15.
//  Copyright © 2015 Romain Menke. All rights reserved.
//

import UIKit


class StatsScreen : UIView {
    
    var slaves : UILabel = UILabel()
    var rebels : UILabel = UILabel()
    var food : UILabel = UILabel()
    var cats : UILabel = UILabel()
    
    var yearsLeft : UILabel = UILabel()
    
    let font = UIFont(name: "Courier-Bold", size: UIFont.systemFontSize() - 3)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.backgroundColor = UIColor.clearColor()
        
        slaves = UILabel(frame: CGRect(x: 15, y: 15, width: 100, height: 10))
        rebels = UILabel(frame: CGRect(x: 15, y: 35, width: 100, height: 10))
        food = UILabel(frame: CGRect(x: 15, y: 55, width: 100, height: 10))
        cats = UILabel(frame: CGRect(x: 15, y: 75, width: 100, height: 10))
        yearsLeft = UILabel(frame: CGRect(x: frame.width - 115, y: 15, width: 100, height: 10))
        
        yearsLeft.textAlignment = NSTextAlignment.Right
        
        slaves.backgroundColor = UIColor.clearColor()
        rebels.backgroundColor = UIColor.clearColor()
        food.backgroundColor = UIColor.clearColor()
        cats.backgroundColor = UIColor.clearColor()
        yearsLeft.backgroundColor = UIColor.clearColor()
        
        slaves.font = font
        rebels.font = font
        food.font = font
        cats.font = font
        yearsLeft.font = font
        
        slaves.text = "slaves: "
        rebels.text = "rebels: "
        food.text = "food: "
        cats.text = "cats: "
        yearsLeft.text = "life: "
        
        self.addSubview(slaves)
        self.addSubview(rebels)
        self.addSubview(food)
        self.addSubview(cats)
        self.addSubview(yearsLeft)
        
    }
    
    func updateStats(stats: Stats) {
        
        slaves.text = "slaves: " + "\(stats.slaves)"
        rebels.text = "rebels: " + "\(stats.rebels)"
        food.text = "food: " + "\(stats.food)"
        cats.text = "cats: " + "\(stats.cats)"
        yearsLeft.text = "life: " + "\(stats.yearsLeft)"
        
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}
