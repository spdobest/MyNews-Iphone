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
        //    loginNetworkCall(email:email,password:pass)
         //    doLogin(email:email,password:pass)
            makeGetApiCall()
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
        
        guard let gitUrl = URL(string: "http://www.veergurudev.com/App/API/login.php?&pass=123456&phone=8249432914") else { return }
        
         let parameters: Parameters = ["phone": email,"pass":password]
        var request = URLRequest(url: gitUrl)
        request.httpMethod = "GET"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        guard let httpBody = try? JSONSerialization.data(withJSONObject: parameters, options: []) else { return }
        request.httpBody = httpBody
        
        URLSession.shared.dataTask(with: gitUrl ) { (data, response
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
    
    func makeGetApiCall() {
         guard let gitUrl = URL(string: "http://www.veergurudev.com/App/API/login.php?&pass=123456&phone=8249432914") else { return }
        let session = URLSession.shared
        session.dataTask(with: gitUrl){ (data,response,error) in
            if let response = response{
                print(response)
            }
            if let data = data{
                print(data)
                do{
                    let json = try JSONSerialization.jsonObject(with: data, options: [])
                    print(json)
                    
                    
                    let decoder = JSONDecoder()
                    let result = try? decoder.decode(LoginResponse.self, from: data) //Use Result.self here
                    print(result)
                    
                    let jsonDecoder = JSONDecoder()
                
                    
                    let employee2 = try jsonDecoder.decode(LoginResponse.self, from: data)
                
                    
                    if let json = try? JSONDecoder().decode(LoginResponse.self, from: data){

                        var loginres = json
                        
                        print(loginres.data?.count)
                        
                    }
                    
                }
                catch{
                    print(error)
                }
            }
        }.resume()
    }
    
/*
     {
     data =     (
     {
     message = "Login successfully";
     name = Maharashtra;
     pic = "";
     state = 17;
     status = 1;
     "total_points" = 0;
     uid = 1442;
     username = spm;
     }
     );
     }
     nil
     typeMismatch(Swift.Int, Swift.DecodingError.Context(codingPath: [MyNews_App.LoginResponse.CodingKeys.data, Foundation.(_JSONKey in _12768CA107A31EF2DCE034FD75B541C9)(stringValue: "Index 0", intValue: Optional(0)), MyNews_App.Data.CodingKeys.status], debugDescription: "Expected to decode Int but found a string/data instead.", underlyingError: nil))

 */
 
    
}
