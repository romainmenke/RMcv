//
//  PListCreator.swift
//  CV
//
//  Created by Romain Menke on 06/11/15.
//  Copyright © 2015 Romain Menke. All rights reserved.
//

import UIKit


extension PyramidOfDoomVC {
    
    func result() {
        
        cleanUp()
        
        newScore(currentStats.score)
        
        let resultView = ScoreScreen(containerSize: self.view.frame.size, stats: currentStats)
        resultView.delegate = self
        self.view.addSubview(resultView)
        
    }
}


extension PyramidOfDoomVC {
    /**
     Compare new score to high score and save if newer is higher
     */
    func newScore(score: Score) {
        
        guard let previousHighScore = getSaveData() where previousHighScore > score else {
            saveGameData(score)
            return
        }
    }
    
    // setter
    private func saveGameData(score:Score) {
        
        guard let documentsURL = NSFileManager.defaultManager().URLsForDirectory(.DocumentDirectory, inDomains: .UserDomainMask).first else {
            return
        }
        
        let fileURL = documentsURL.URLByAppendingPathComponent("gameData.plist")
        let fileManager = NSFileManager.defaultManager()
        
        guard let path = fileURL.path else {
            return
        }
        
        if !(fileManager.fileExistsAtPath(path)) {
            createFileWithPath(path, fileManager: fileManager)
        }
        
        let dict : NSMutableDictionary = score.dictionary as NSMutableDictionary
        
        dict.writeToFile(path, atomically: true)

    }
    
    // getter
    private func getSaveData() -> Score? {
        
        guard let documentsURL = NSFileManager.defaultManager().URLsForDirectory(.DocumentDirectory, inDomains: .UserDomainMask).first else {
            return nil
        }
        
        let fileURL = documentsURL.URLByAppendingPathComponent("gameData.plist")
        
        guard let path = fileURL.path, let dict = NSDictionary(contentsOfFile: path), let score = Score(dict: dict) else {
            return nil
        }
        
        return score
        
    }
    
    // there is no gameData.plist file yet, create one
    private func createFileWithPath(path:String, fileManager:NSFileManager) {
        
        guard let bundle = NSBundle.mainBundle().pathForResource("gameData", ofType: "plist") else {
            return
        }
        
        // hear do try in threatening voice eveytime
        do {
            try fileManager.copyItemAtPath(bundle, toPath: path)
        } catch {
            print("do some error handling here before shipping, p.s. I am PoDplist")
        }
        
    }
}


