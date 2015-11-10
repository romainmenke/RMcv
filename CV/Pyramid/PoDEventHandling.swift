//
//  PoDEventHandling.swift
//  CV
//
//  Created by Romain Menke on 10/11/15.
//  Copyright © 2015 Romain Menke. All rights reserved.
//

import UIKit


extension PyramidOfDoomVC {
    
    func theChoseOne(statsMod: Stats, animation: EventArt?) {
        
        if !alive {
            return
        }
        
        if let cView = choiceView {
            cView.removeFromSuperview()
        }
        
        if let ani = animation {
            eventView = EventAscii(frame: CGRect(x: -100, y: 245, width: self.view.frame.width, height: 20), animation: ani)
            self.view.addSubview(eventView!)
            eventView!.start()
        }
        
        currentStats += statsMod
        
        if let uwStatsScreen = statsScreen {
            uwStatsScreen.updateStats(currentStats)
        }
        
        
        resumeTimersAfterEvent()
        
    }
}