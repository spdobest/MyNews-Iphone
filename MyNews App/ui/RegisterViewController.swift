//
//  LoginViewController.swift
//  MyNews App
//
//  Created by sibaprasad on 24/03/18.
//  Copyright © 2018 SP inc. All rights reserved.
//

import Foundation
import UIKit
import Alamofire
class RegisterViewController : BaseviewController, UIPickerViewDelegate, UIPickerViewDataSource{
    
    var pickerData: [String] = [String]()
    
    @IBOutlet var textFIeldName: UITextField!
    @IBOutlet var textFIeldEmail: UITextField!
    @IBOutlet var textFieldMobile: UITextField!
    @IBOutlet var textFieldPassword: UITextField!
    @IBOutlet var buttonRegister: UIButton! 
    
    @IBOutlet var statePickerview: UIPickerView!
    
    override func viewDidLoad() {
        initView()
        registerUser()

        // Input data into the Array:
        pickerData = ["Andhra Pradesh",
                      "Arunachal Pradesh","Assam", "Bihar", "Chhattisgarh", "Goa",
                      "Gujarat", "Haryana", "Himachal Pradesh", "Jammu & Kashmir",
                      "Jharkhand","Karnataka","Kerala","Madhya Pradesh","Maharashtra",
                      "Manipur","Meghalaya","Mizoram","Nagaland","Odisha","Punjab",
                      "Rajasthan","Sikkim","Tamil Nadu","Tripura","Uttarakhand","Uttar Pradesh","West Bengal"]
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        
    }
    func initView() {
        buttonRegister.layer.cornerRadius = 5
        buttonRegister.layer.borderWidth = 1
        buttonRegister.layer.borderColor = UIColor.black.cgColor
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return pickerData[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
       return pickerData.count
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        print("Picker data \(pickerData[row])")
    }
    
    func registerUser()  {
        
        let parameters: Parameters = ["foo": "bar"]
        
        Alamofire.request( "https://httpbin.org/get",method: .get, parameters: parameters)
            .responseJSON { response in
                print(response.request)  // original URL request
                print(response.response) // URL response
                print(response.data)     // server data
                print(response.result)   // result of response serialization
                
                if let JSON = response.result.value {
                    print("JSON: \(JSON)")
                }
        }
    }
    
}

