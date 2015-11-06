//
//  WebVC.swift
//  CV
//
//  Created by Romain Menke on 05/11/15.
//  Copyright © 2015 Romain Menke. All rights reserved.
//

// Extension : WLoadURL -> url loading func -> UIWebView.loadRequest(_)(NSURLRequest(URL: _))


import UIKit

class WebVC: UIViewController {

    var address : String?
    var navTitle : String?
    
    @IBOutlet weak var navItem: UINavigationItem!
    @IBOutlet weak var webView: UIWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // load url in webview
        loadUrl()
        
        // set title of navigation bar
        if let uwTitle = navTitle {
            navItem.title = uwTitle
        }
    }
    
    override func prefersStatusBarHidden() -> Bool {
        return true
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    // back button was pressed
    @IBAction func done(sender: AnyObject) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
}
