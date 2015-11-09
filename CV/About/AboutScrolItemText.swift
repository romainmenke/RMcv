//
//  AboutScrolItem.swift
//  CV
//
//  Created by Romain Menke on 08/11/15.
//  Copyright © 2015 Romain Menke. All rights reserved.
//

import UIKit

// more static design

class ATextScrollItem : UIView {
    
    
    let label : UILabel
    let border : UIView
    
    let font = UIFont(name: "DamascusLight", size: UIFont.systemFontSize() - 3)
    
    override init(frame: CGRect) {
        label = UILabel(frame: CGRect(x: 0, y: 0, width: frame.size.width, height: frame.size.height - 2))
        border = UIView(frame: CGRect(x: 50, y: frame.size.height - 2, width: frame.size.width - 100, height: 2))
        
        label.numberOfLines = 3
        label.font = font
        label.textAlignment = NSTextAlignment.Center
        
        border.backgroundColor = UIColor.darkGrayColor()
        
        super.init(frame: frame)
        
        self.addSubview(label)
        self.addSubview(border)
    }
    
    // but is it really convenient?
    convenience init(containerSize: CGSize) {
        
        self.init(frame: CGRect(x: 0, y: 0, width: containerSize.width, height: 100))

    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}