//
//  SettingViewController.swift
//  MyNews App
//
//  Created by sibaprasad on 01/04/18.
//  Copyright © 2018 SP inc. All rights reserved.
//

import Foundation
import UIKit
class SettingViewController:BaseviewController{
    
    @IBOutlet var settingWebview: UIWebView!
    
    override func viewDidLoad() {
        
        
        let url = URL (string: "https://support.apple.com/en-in/HT202033")
        let requestObj = URLRequest(url: url!)
        settingWebview.loadRequest(requestObj)
        
    }
    override func viewWillAppear(_ animated: Bool) {
        
    }
    
    
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        
    }
    
    func webViewDidStartLoad(webView: UIWebView!){ // show indicator
        showProgressDialog("Loading")
    }
    func webViewDidFinishLoad(webView: UIWebView!) {// hide indicator
        hideProgress()
    }
    func webView(webView: UIWebView!, didFailLoadWithError error: NSError!) {// hide indicator
        
    }
}
