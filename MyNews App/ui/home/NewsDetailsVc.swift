//
//  NewsDetailsVc.swift
//  MyNews App
//
//  Created by sibaprasad on 29/03/18.
//  Copyright © 2018 SP inc. All rights reserved.
//

import Foundation
import UIKit
class NewsDetailsVc : BaseviewController{
    
    @IBOutlet var img: UIImageView!
    
    @IBOutlet var labelNewsTitle: UILabel!
    
    @IBOutlet var labelDate: UILabel!
    @IBOutlet var labelLikeCount: UILabel!
    @IBOutlet var newsDesc_Details: UILabel!
    var getTitle = String()
    var getDesc = String()
    var getImageUrl = String()
    var getLikeCount = Int()
    var getDate = String()
    
    
    override func didReceiveMemoryWarning() {
        
    }
    
    override func viewDidLoad() {
        labelNewsTitle.text = getTitle
        newsDesc_Details.text = getDesc
        labelLikeCount.text = "Like Count  \(getLikeCount)"
         labelDate.text = "Date  \(getDate)"
        AppUtils.loadImage(imageView: img, url: getImageUrl)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        
    }  
    
    /*  func webViewDidStartLoad(webView: UIWebView!){ // show indicator
     showProgressDialog("Loading")
     }
     func webViewDidFinishLoad(webView: UIWebView!) {// hide indicator
     hideProgress()
     }
     func webView(webView: UIWebView!, didFailLoadWithError error: NSError!) {// hide indicator
     }
     */
}

