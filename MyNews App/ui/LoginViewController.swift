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

class LoginViewController : BaseviewController{
    
    @IBOutlet var textFieldEmail: UITextField!
    @IBOutlet var textFieldPassword: UITextField!
    @IBOutlet var buttonLogin: UIButton!
    @IBOutlet var buttonRegister: UIButton!
    @IBOutlet var buttonForgotPwd: UIButton!
    
    var apputil = AppUtils()
    
    
    @IBAction func onLoginClick(_ sender: AnyObject) {
    
        textFieldEmail.text = "8249432914"
        textFieldPassword.text = "123456"
        
        let email = textFieldEmail.text!
        let pass = textFieldPassword.text!
        
       
        if (!apputil.isInternetAvailable()) {
            showAlert("Error",msg: "Check Internet Connection",isShowCancel: false)
        }
        else if ( email=="" || pass=="") {
            showAlert("Error",msg: "Email and Password Cant be Empty",isShowCancel: false)
        }
        else if (  pass == "" ) {
            showAlert("Error",msg: "Email and Password Cant be Empty",isShowCancel: false)
        }
        else if pass.characters.count<6{
            showAlert("Error",msg: "Password Length must be minimum 6",isShowCancel: false)
        }
        else{
            loginNetworkCall(email:email,password:pass)
           //  doLogin(email:email,password:pass)
            makeNsUrlConnectionAPIcall()
            
        }
        
    }
    
    override func viewDidLoad() {
        
        
        initView()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        
    }
    func initView() {
        buttonLogin.layer.cornerRadius = 5
        buttonLogin.layer.borderWidth = 1
        buttonLogin.layer.borderColor = UIColor.black.cgColor
    }
    
    func doLogin(email:String,password:String) {
        
        let parameters: Parameters = ["phone": email,"pass":password]
        
        Alamofire.request( UrlConstants.API_LOGIN,method: .get, parameters: parameters)
            .responseJSON { response in
                
                print(response.request)  // original URL request
                print(response.response) // URL response
                print(response.data)     // server data
                print(response.result)   // result of response serialization
                
                
do {
                if let JSON = response.result.value {
                    print("JSON: \(JSON)")
                     let loginresponse =  try JSONDecoder().decode(LoginResponse.self, from: response.data!)
                    print("JSON: \(loginresponse.data![0])")
                  
                    
                }
                }
                catch let error as NSError {
                    print(error.localizedDescription)
                }
        }
    }
    
    func loginNetworkCall(email:String,password:String){
    
        showProgressDialog("Loading...")
        
        guard let gitUrl = URL(string: UrlConstants.API_LOGIN) else { return }
        
         let parameters: Parameters = ["phone": email,"pass":password]
        var request = URLRequest(url: gitUrl)
        request.httpMethod = "GET"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        guard let httpBody = try? JSONSerialization.data(withJSONObject: parameters, options: []) else { return }
        request.httpBody = httpBody
        
        
        
        
        
        URLSession.shared.dataTask(with: request as URLRequest) { (data, response
            , error) in
            
            guard let data = data else {
                print("Error: No data to decode")
                return
            }
            
            print(data)
            
            guard let loginData = try? JSONDecoder().decode(LoginResponse.self, from: data) else {
                print("Error: Couldn't decode data into LoginModel")
                return
            }
            
            print("blog title: \(loginData.data![0].message)")
            
            DispatchQueue.main.async {
                self.hideProgress()
        
            }
            
            }.resume()
        
        
    }
    
    func makeLoginWithDictionary(phone:String,password:String){
        
        
        let url = URL(string: UrlConstants.API_LOGIN+"phone=\(phone)&pass=\(password)")
        let task = URLSession.shared.dataTask(with: url!) { (data, response, error) in
            
//            let someDictionaryFromJSON = try JSONSerialization.jsonObject(with: data, options: .allowFragments) as! [String: Any]
     //       let json4Swift_Base = Json4Swift_Base(someDictionaryFromJSON)
            
        }
        task.resume()
    }
    
    func makeNsUrlConnectionAPIcall(){
        let url = URL(string: "http://jsonplaceholder.typicode.com/users/2")
        if let usableUrl = url {
            let request = URLRequest(url: usableUrl)
            let task = URLSession.shared.dataTask(with: request, completionHandler: { (data, response, error) in
                
                
                guard let personData = try? JSONDecoder().decode(Json4Swift_Base.self, from: data!) else {
                    print("Error: Couldn't decode data into LoginModel")
                    return
                }
                
                print("blog title: \(personData.name)")

                
            })
            task.resume()
        }
    }
    
    func makeAPiCalUsingDictionArymapping(){
        
        
    }
    
}
