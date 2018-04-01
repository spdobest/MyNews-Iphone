//
//  ViewController.swift
//  MyNews App
//
//  Created by sibaprasad on 23/03/18.
//  Copyright © 2018 SP inc. All rights reserved.
//

import UIKit
import CoreData

class LandingViewController: UIViewController {
    @IBOutlet var loginButton: UIButton!
    @IBOutlet var registerButton: UIButton!
    
    var managedContext:NSManagedObjectContext?
    var userEntity:NSEntityDescription?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return }
        managedContext  = appDelegate.persistentContainer.viewContext
        userEntity = NSEntityDescription.entity(forEntityName: "User", in: managedContext!)!
        
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
        
        addUser()
       getUserData()
        
    }

    func addUser(){
        
        
        guard let appDelegate =
            UIApplication.shared.delegate as? AppDelegate else {
                return
        }
        
        // 1
        let managedContext =
            appDelegate.persistentContainer.viewContext
        
        // 2
        let entity =
            NSEntityDescription.entity(forEntityName: "User",
                                       in: managedContext)!

        let user = NSManagedObject(entity: entity,
                                     insertInto: managedContext)
        
        user.setValue("John", forKeyPath: "name")
        user.setValue("john@test.com", forKey: "email")
        user.setValue("9768235871", forKey: "mobile")
        user.setValue("john@test.com", forKey: "email")
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy/MM/dd"
        let date = formatter.date(from: "1990/10/08")
        user.setValue("1990/10/08", forKey: "date_of_birth")
        user.setValue("address", forKey: "address")
        
        // 4
        do {
            try managedContext.save()
        } catch let error as NSError {
            print("Could not save. \(error), \(error.userInfo)")
        }
        
        
    }
    
    func getUserData(){
        
        // Initialize Fetch Request
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>()
        
        // Create Entity Description
        let entityDescription = NSEntityDescription.entity(forEntityName: "User", in: managedContext!)
        
        // Configure Fetch Request
        fetchRequest.entity = entityDescription
        
        do {
            let result = try managedContext?.fetch(fetchRequest)
            print(result)
            
        } catch {
            let fetchError = error as NSError
            print(fetchError)
        }
        
    }
    
}

