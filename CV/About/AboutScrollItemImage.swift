//
//  AImageScrollItem.swift
//  CV
//
//  Created by Romain Menke on 08/11/15.
//  Copyright © 2015 Romain Menke. All rights reserved.
//

import UIKit

// more static design

class AImageScrollItem : UIImageView {
    

    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    // but is it really convenient?
    convenience init(frame:CGRect, image:UIImage?) {
        
        self.init(frame:frame)
        
        self.image = image
        self.contentMode = UIViewContentMode.ScaleAspectFit
        
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}