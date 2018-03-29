//
//  ViewController.swift
//  MyNews App
//
//  Created by sibaprasad on 23/03/18.
//  Copyright © 2018 SP inc. All rights reserved.
//

import UIKit

class LandingViewController: UIViewController {
    @IBOutlet var loginButton: UIButton!
    @IBOutlet var registerButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        initView()
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    func initView() {
        AppUtils.setButtonBorder(button: loginButton,btnColor: UIColor.blue.cgColor,boarderColor: UIColor.blue.cgColor,cornerRadious: 5,boarderWidth: 0)
        
        AppUtils.setButtonBorder(button: registerButton,btnColor: UIColor.blue.cgColor,boarderColor: UIColor.blue.cgColor,cornerRadious: 5,boarderWidth: 0)
    }

}

