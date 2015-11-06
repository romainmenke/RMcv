//
//  EventArt.swift
//  CV
//
//  Created by Romain Menke on 05/11/15.
//  Copyright © 2015 Romain Menke. All rights reserved.
//

import Foundation


struct EventArt {
    var eventString = ""
    var fullString = ""
    var forwards : Bool = true
    
    static let barbarians = EventArt(eventString: ",``',,``.., ..',`,' ,`,',''`", fullString: ",``',,``.., ..',`,' ,`,',''`                                                         ", forwards: true)
    
    static let army = EventArt(eventString: "\\\\,,,'',,'',,'',,'',\\\\'',,'',,''", fullString: "                                                         \\\\,,,'',,'',,'',,'',\\\\'',,'',,''", forwards: false)
    
    
}
