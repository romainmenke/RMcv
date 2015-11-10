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
    
    static func barbarians() -> EventArt {
        return EventArt(eventString: ",``',,``.., ..',`,' ,`,',''`", fullString: ",``',,``.., ..',`,' ,`,',''`                                                         ", forwards: true)
    }
    
    static func army() -> EventArt {
        return EventArt(eventString: "\\\\,,,'',,'',,'',,'',\\\\'',,'',,''", fullString: "                                                         \\\\,,,'',,'',,'',,'',\\\\'',,'',,''", forwards: false)
    }
    
}
