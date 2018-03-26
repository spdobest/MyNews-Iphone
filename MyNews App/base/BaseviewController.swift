//
//  BaseviewController.swift
//  MyNews App
//
//  Created by sibaprasad on 23/03/18.
//  Copyright © 2018 SP inc. All rights reserved.
//

import Foundation
import UIKit
class BaseviewController : UIViewController{
    
    var progressHud : ProgressHUD!
    
    override func viewDidLoad() {
         progressHud  = ProgressHUD(text: "Loading...")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        
    }
    
    func showAlert(_ title :String,msg :String,isShowCancel : Bool) {
        let refreshAlert = UIAlertController(title: title, message: msg, preferredStyle: UIAlertControllerStyle.alert)
        
        refreshAlert.addAction(UIAlertAction(title: "Ok", style: .default, handler: { (action: UIAlertAction!) in
            print("Handle Ok logic here")
        }))
        if isShowCancel {
            refreshAlert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: { (action: UIAlertAction!) in
                print("Handle Cancel Logic here")
            }))
        }
        
        present(refreshAlert, animated: true, completion: nil)
    }
    
    func showProgressDialog(_ message : String){
        if(progressHud == nil){
            progressHud  = ProgressHUD(text: message)
            progressHud.setTitle(message: message)
            self.view.addSubview(progressHud)
        }
        progressHud.setTitle(message: message)
        self.view.addSubview(progressHud)
        
        progressHud.show()
    }
    
    func hideProgress()  {
        if(progressHud != nil){
            progressHud.hide()
        }
    }
    
}
