//
//  ContactVC.swift
//  CV
//
//  Created by Romain Menke on 07/11/15.
//  Copyright © 2015 Romain Menke. All rights reserved.
//

import UIKit
import MessageUI

class ContactVC: UIViewController, MFMailComposeViewControllerDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    @IBAction func makeCall(sender: AnyObject) {
        
        email()
        
    }

}


extension ContactVC {
    
    func call() {
        
        guard let url = NSURL(string: "tel://0032485272919") else {
            return
        }
        UIApplication.sharedApplication().openURL(url)
    }
}

extension ContactVC {
    
    
    func email() {
        
        let mailComposeViewController = configuredMailComposeViewController()
        if MFMailComposeViewController.canSendMail() {
            self.presentViewController(mailComposeViewController, animated: true, completion: nil)
        } else {
            self.showSendMailErrorAlert()
        }
        
    }
    
    func configuredMailComposeViewController() -> MFMailComposeViewController {
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
    
    func showSendMailErrorAlert() {
        
        let alertController = UIAlertController(title: "Email could not be send", message: "Please check your e-mail configurations and try again.", preferredStyle: UIAlertControllerStyle.Alert)
        
        let alert = UIAlertAction(title: "OK", style: UIAlertActionStyle.Cancel, handler: nil)
        
        alertController.addAction(alert)
        
        self.presentViewController(alertController, animated: true, completion: nil)

    }
    
    // MARK: MFMailComposeViewControllerDelegate
    
    func mailComposeController(controller: MFMailComposeViewController, didFinishWithResult result: MFMailComposeResult, error: NSError?) {
        controller.dismissViewControllerAnimated(true, completion: nil)
        
    }
    
}

extension ContactVC {
    
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
    
}
