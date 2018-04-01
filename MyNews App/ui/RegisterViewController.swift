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
class RegisterViewController : BaseviewController, UIPickerViewDelegate, UIPickerViewDataSource, UIImagePickerControllerDelegate,UIPopoverControllerDelegate,UINavigationControllerDelegate{
    
    var apputil:AppUtils = AppUtils()
    
    var picker:UIImagePickerController?=UIImagePickerController()
    @IBOutlet var imageProfile: UIImageView!
    var pickerData: [String] = [String]()
    
    
    // ALL THE WIDGETS
    @IBOutlet var onRegisterClick: UIButton!
    @IBOutlet var textFIeldName: UITextField!
    @IBOutlet var textFIeldEmail: UITextField!
    @IBOutlet var textFieldMobile: UITextField!
    @IBOutlet var textFieldPassword: UITextField!
    @IBOutlet var buttonRegister: UIButton!
    @IBOutlet var statePickerview: UIPickerView!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        initView() 
picker?.delegate=self
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
    
    /* CLICK LISTENER */
    @IBAction func onRegisterClick(_ sender: Any) {
         self.performSegue(withIdentifier: "registerToHome", sender: self)
        
        if (!apputil.isInternetAvailable()) {
            showAlert("Error",msg: "Check Internet Connection",isShowCancel: false)
        }
        else if ( textFIeldEmail.text!=="" || textFieldPassword.text!=="" || textFieldMobile.text! == "" || textFIeldName.text == "" ) {
            showAlert("Error",msg: "Please Enter all the Fields",isShowCancel: false)
        }
        else if (textFieldPassword.text?.characters.count)!<6{
            showAlert("Error",msg: "Password Length must be minimum 6",isShowCancel: false)
        }
        else{
       // registerUser()
        }
    }
    @IBAction func onProfileCLick(_ sender: Any) {
        showPhotoPickerDialog()
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
        let parameters: Parameters = ["name": textFIeldName.text,"email": textFIeldEmail.text,"phone": textFieldMobile.text,"pass": textFieldPassword.text,"state": "12","proof": "","token": "12321313"]
        
        Alamofire.request( UrlConstants.API_REGISTER,method: .get, parameters: parameters)
            .responseJSON { response in
                print(response.request)  // original URL request
                print(response.response) // URL response
                print(response.data)     // server data
                print(response.result)   // result of response serialization
                
                if let JSON = response.result.value {
                    print("JSON: \(JSON)")
                }
                
                
                
                do {
                    if let JSON = response.result.value {
                        print("JSON: \(JSON)")
                        let registerResponse =  try JSONDecoder().decode(RegisterResponse.self, from: response.data!)
                        print("JSON: \(registerResponse.data![0])")
                        
                        var loginData = registerResponse.data![0]
                        
                        
                        if loginData.status == "1" {
                            self.performSegue(withIdentifier: "registerToHome", sender: self)
                        }
                        
                    }
                    
                }
                catch let error as NSError {
                    print(error.localizedDescription)
                    
                    self.showAlert("Error", msg: "Unable to register", isShowCancel:false)
                    
                }
        }
    }
    
    func showPhotoPickerDialog(){
        let refreshAlert = UIAlertController(title: "Image Picker", message: "Please Choose Image Using", preferredStyle: UIAlertControllerStyle.alert)
        
        refreshAlert.addAction(UIAlertAction(title: "Photo Gallery", style: .default, handler: { (action: UIAlertAction!) in
            
        }))
        
        refreshAlert.addAction(UIAlertAction(title: "Camera", style: .cancel, handler: { (action: UIAlertAction!) in
            
        }))
        
        present(refreshAlert, animated: true, completion: nil)
    }
    
    func openGallary()
    {
        picker!.allowsEditing = false
        picker!.sourceType = UIImagePickerControllerSourceType.photoLibrary
        present(picker!, animated: true, completion: nil)
    }
    
    
    func openCamera()
    {
        if(UIImagePickerController .isSourceTypeAvailable(UIImagePickerControllerSourceType.camera)){
            picker!.allowsEditing = false
            picker!.sourceType = UIImagePickerControllerSourceType.camera
            picker!.cameraCaptureMode = .photo
            present(picker!, animated: true, completion: nil)
        }else{
            let alert = UIAlertController(title: "Camera Not Found", message: "This device has no Camera", preferredStyle: .alert)
            let ok = UIAlertAction(title: "OK", style:.default, handler: nil)
            alert.addAction(ok)
            present(alert, animated: true, completion: nil)
        }
    }
    
    
    func imagePickerControllerDidCancel(picker: UIImagePickerController) {
        dismiss(animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController,
                               didFinishPickingMediaWithInfo info: [String : AnyObject])
    {
        let chosenImage = info[UIImagePickerControllerOriginalImage] as! UIImage //2
        imageProfile.contentMode = .scaleAspectFit //3
        imageProfile.image = chosenImage //4
        dismiss(animated:true, completion: nil) //5
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        switch segue.identifier {
        case "registerToHome"?:
            let welcomeVc = segue.destination as! HomeViewController
        // welcomeVc.myValue = "Sibaprasad"
        case "asd"?:
            print("adasdas")
        default :
            print("default")
        }
    }
}

