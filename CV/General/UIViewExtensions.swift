//
//  UIViewExtensions.swift
//  CV
//
//  Created by Romain Menke on 09/11/15.
//  Copyright © 2015 Romain Menke. All rights reserved.
//

import UIKit


extension CGRect {
    
    var bottomLeft : CGPoint {
        var point = origin
        point.y += height
        return point
    }
    
    var topLeft : CGPoint {
        return origin
    }
    
    var bottomRight : CGPoint {
        var point = origin
        point.y += height
        point.x += width
        return point
    }
    
    var topRight : CGPoint {
        var point = origin
        point.x += width
        return point
    }
    
}