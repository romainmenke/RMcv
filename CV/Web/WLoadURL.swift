//
//  WLoadURL.swift
//  CV
//
//  Created by Romain Menke on 06/11/15.
//  Copyright © 2015 Romain Menke. All rights reserved.
//

import UIKit


extension WebVC {
    
    /**
     Load URL in WebView from stored address
     */
    func loadUrl() {
        
        guard let uwAddress = address, let url = NSURL(string: uwAddress) else {
            return
        }
        
        UIWebView.loadRequest(webView)(NSURLRequest(URL: url))
        
    }
    
}