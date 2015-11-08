//
//  UIViewExtensions.swift
//  CV
//
//  Created by Romain Menke on 09/11/15.
//  Copyright © 2015 Romain Menke. All rights reserved.
//

import UIKit


extension UIView {
    
    var bottomLeft : CGPoint {
        var point = self.frame.origin
        point.y += self.frame.height
        return point
    }
    
    var topLeft : CGPoint {
        return self.frame.origin
    }
    
    var bottomRight : CGPoint {
        var point = self.frame.origin
        point.y += self.frame.height
        point.x += self.frame.width
        return point
    }
    
    var topRight : CGPoint {
        var point = self.frame.origin
        point.x += self.frame.width
        return point
    }
    
}