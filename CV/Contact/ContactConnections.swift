//
//  ContactConnections.swift
//  CV
//
//  Created by Romain Menke on 07/11/15.
//  Copyright © 2015 Romain Menke. All rights reserved.
//

import UIKit
import MessageUI

extension CallVC {
    
    func call() {
        
        guard let url = NSURL(string: "tel://0032485272919") else {
            return
        }
        UIApplication.sharedApplication().openURL(url)
    }
}

extension MailVC {
    
    
    func email() {
        
        let mailComposeViewController = configuredMailComposeViewController()
        if MFMailComposeViewController.canSendMail() {
            self.presentViewController(mailComposeViewController, animated: true, completion: nil)
        } else {
            self.showSendMailErrorAlert()
        }
        
    }
    
    private func configuredMailComposeViewController() -> MFMailComposeViewController {
        let mailComposerVC = MFMailComposeViewController()
        mailComposerVC.mailComposeDelegate = self // Extremely important to set the --mailComposeDelegate-- property, NOT the --delegate-- property
        
        
        if let highScore = getSaveData() {
            mailComposerVC.setMessageBody("Your message goes here \n \n \n \n \n Pyramid of Doom score : \(highScore.gameScore)", isHTML: false)
        } else {
            mailComposerVC.setMessageBody("Your message goes here", isHTML: false)
        }
        
        
        mailComposerVC.setToRecipients(["romainmenke@me.com"])
        mailComposerVC.setSubject("We saw your CV and...")
        
        return mailComposerVC
    }
    
    private func showSendMailErrorAlert() {
        
        let alertController = UIAlertController(title: "Email could not be send", message: "Please check your e-mail configurations and try again.", preferredStyle: UIAlertControllerStyle.Alert)
        
        let alert = UIAlertAction(title: "OK", style: UIAlertActionStyle.Cancel, handler: nil)
        
        alertController.addAction(alert)
        
        self.presentViewController(alertController, animated: true, completion: nil)
        
    }
    
    
    func mailComposeController(controller: MFMailComposeViewController, didFinishWithResult result: MFMailComposeResult, error: NSError?) {
        controller.dismissViewControllerAnimated(true, completion: nil)
        
    }
    
}

extension MailVC {
    
    func getSaveData() -> Score? {
        
        guard let documentsURL = NSFileManager.defaultManager().URLsForDirectory(.DocumentDirectory, inDomains: .UserDomainMask).first else {
            return nil
        }
        
        let fileURL = documentsURL.URLByAppendingPathComponent("gameData.plist")
        
        guard let path = fileURL.path, let dict = NSDictionary(contentsOfFile: path), let score = Score(dict: dict) else {
            return nil
        }
        
        return score
        
    }
    
}