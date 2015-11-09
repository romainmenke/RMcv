//
//  AboutScrollItemBadge.swift
//  CV
//
//  Created by Romain Menke on 08/11/15.
//  Copyright © 2015 Romain Menke. All rights reserved.
//

import UIKit

// even more static design

class ABadgeContainer : UIView {
    
    
    init(origin: CGPoint, width: CGFloat) {
        
        let margin = width / 7
        let badgeWidth = margin * 2
        let badgeNames : [String] = ["swift","camera","photoshop","arduino","travel","boat","rings","handy"]
        
        let newHeight = (badgeWidth * 4) + (margin * 3)
        
        let newFrame = CGRect(origin: origin, size: CGSize(width: width, height: newHeight))
        
        super.init(frame: newFrame)
        
        
        var runningOriginY : CGFloat = 0
        
        for i in 0..<badgeNames.count {
            
            var badgeFrame = CGRect(x: margin, y: runningOriginY, width: badgeWidth, height: badgeWidth)
            
            if (i % 2) != 0 {
                
                badgeFrame.origin.x += margin + badgeWidth
                
                runningOriginY += margin + badgeWidth
                
            }
            
            let badge = UIImageView(frame: badgeFrame)
            badge.contentMode = UIViewContentMode.ScaleAspectFit
            badge.image = UIImage(named: badgeNames[i])
            self.addSubview(badge)
        }
        
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}