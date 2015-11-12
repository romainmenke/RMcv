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
    
    @IBOutlet weak var constraintsView: UIView!
    @IBOutlet weak var navItem: UINavigationItem!
    var webView: UIWebView?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        webView = UIWebView(frame: CGRect(origin: CGPointZero, size: constraintsView.frame.size))
        constraintsView.addSubview(webView!)
        
        // load url in webview
        loadUrl()
        
        
        // set title of navigation bar
        if let uwTitle = navTitle {
            navItem.title = uwTitle
        }
    }

    override func viewWillDisappear(animated: Bool) {
        if let uwWebView = webView {
            uwWebView.removeFromSuperview()
            webView = nil
        }
    }
    
    override func prefersStatusBarHidden() -> Bool {
        return true
    }
    

    override func didReceiveMemoryWarning() {

        super.didReceiveMemoryWarning()
    }
    
    // back button was pressed
    @IBAction func done(sender: AnyObject) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
}
