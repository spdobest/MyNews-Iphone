//
//  ExamViewController.swift
//  MyNews App
//
//  Created by sibaprasad on 29/03/18.
//  Copyright © 2018 SP inc. All rights reserved.
//

import Foundation
import UIKit
import CoreData
class ExamViewController :BaseviewController{
    
    var questions: [NSManagedObject] = []
    
    @IBOutlet var labelQuestion: UILabel!
    
    @IBOutlet var btnOption1: UIButton!
    
    @IBOutlet var btnOption2: UIButton!
    
    @IBOutlet var btnOption3: UIButton!
    
    @IBOutlet var btnOption4: UIButton!
    
    
    @IBOutlet var btnPrevious: UIButton!
    
    @IBOutlet var btnNext: UIButton!
    
    @IBAction func onNextBtnClick(_ sender: Any) {
        if(position<questions.count){
            position = position+1
            setExamData(position:position)
        }
    }
    
    @IBAction func onPreviousCLick(_ sender: Any) {
        if(position>=1){
            position = position-1
            setExamData(position:position)
        }
    }
    
    var position:Int = 0
    
   
    @IBAction func onOption1Click(_ sender: Any) {
        setButtonSelector(option:1)
    }
    
    @IBAction func onOption2Click(_ sender: Any) {
        setButtonSelector(option:2)
    }
    
    @IBAction func onOption3Click(_ sender: Any) {
        setButtonSelector(option:3)
    }
    
    
    @IBAction func onOption4Click(_ sender: Any) {
        setButtonSelector(option:4)
    }
    
    
    
    var examTimer: Timer!
    var questionPosition:Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        initView()
        
        if(PreferenceUtils.getIsDataAvailable()){
            
        }
        else {
            addQuestions()
        }
        fetchQuestions()
        
        setExamData(position:0)
         setButtonSelector(option:0)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        
    }
    
    func setTheQuestion(position:Int){
        
        
         self.questionPosition = questionPosition+1
    }
    
    func runTimer() {
        examTimer = Timer.scheduledTimer(timeInterval: 1, target: self,   selector: (#selector(ExamViewController.updateTimer)), userInfo: nil, repeats: true)
    }
    
    @objc static func updateTimer() {
       
    }
    
    func initView(){
        
        AppUtils.setButtonBorder(button: btnNext,btnColor: UIColor.blue.cgColor,boarderColor: UIColor.blue.cgColor,cornerRadious: 5,boarderWidth: 0)
        
        AppUtils.setButtonBorder(button: btnPrevious,btnColor: UIColor.blue.cgColor,boarderColor: UIColor.blue.cgColor,cornerRadious: 5,boarderWidth: 0)
    }
    
    func addQuestions(){
            
            guard let appDelegate =
                UIApplication.shared.delegate as? AppDelegate else {
                    return
            }
            
            // 1
            let managedContext =
                appDelegate.persistentContainer.viewContext
            
            // 2
            let entity =
                NSEntityDescription.entity(forEntityName: "ExamModel",
                                           in: managedContext)!
        
       // question1
            let exam1 = NSManagedObject(entity: entity,
                                       insertInto: managedContext)
            exam1.setValue("The ratio of width of our National flag to its length is", forKeyPath: "question")
            exam1.setValue("3:5", forKey: "option1")
            exam1.setValue("2.3", forKey: "option2")
            exam1.setValue("2.4", forKey: "option3")
            exam1.setValue("3.0", forKey: "option4")
            exam1.setValue("2.3", forKey: "answer")
        
        // question2
        let exam2 = NSManagedObject(entity: entity,
                                    insertInto: managedContext)
        exam2.setValue("Rabindranath Tagore's 'Jana Gana Mana' has been adopted as India's National Anthem. How many stanzas of the said song were adopted?", forKeyPath: "question")
        exam2.setValue("Only the first stanza", forKey: "option1")
        exam2.setValue("The whole song", forKey: "option2")
        exam2.setValue("Third and Fourth stanza", forKey: "option3")
        exam2.setValue("First and Second stanza", forKey: "option4")
        exam2.setValue("Only the first stanza", forKey: "answer")
        
       
        
        // question1
        let exam3 = NSManagedObject(entity: entity,
                                    insertInto: managedContext)
        exam3.setValue("'Natya - Shastra' the main source of India's classical dances was written by", forKeyPath: "question")
        exam3.setValue("Nara Muni", forKey: "option1")
        exam3.setValue("Bharat Muni", forKey: "option2")
        exam3.setValue("Abhinav Gupt", forKey: "option3")
        exam3.setValue("Tandu Muni", forKey: "option4")
        exam3.setValue("Bharat Muni", forKey: "answer")
        
        // question2
        let exam4 = NSManagedObject(entity: entity,
                                    insertInto: managedContext)
        exam4.setValue("The percentage of earth surface covered by India is", forKeyPath: "question")
        exam4.setValue("2.4", forKey: "option1")
        exam4.setValue("3.4", forKey: "option2")
        exam4.setValue("4.4", forKey: "option3")
        exam4.setValue("5.4", forKey: "option4")
        exam4.setValue("2.4", forKey: "answer")
        
        
        // question1
        let exam5 = NSManagedObject(entity: entity,
                                    insertInto: managedContext)
        exam5.setValue("The India's highest annual rainfall is reported at", forKeyPath: "question")
        exam5.setValue("Namchi, Sikkim", forKey: "option1")
        exam5.setValue("Churu, Rajasthan", forKey: "option2")
        exam5.setValue("Mawsynram, Meghalaya", forKey: "option3")
        exam5.setValue("Chamba, Himachal Pradesh", forKey: "option4")
        exam5.setValue("Mawsynram, Meghalaya", forKey: "answer")
        
        // question2
        let exam6 = NSManagedObject(entity: entity,
                                    insertInto: managedContext)
        exam6.setValue("The state having a largest area of forest cover in India is", forKeyPath: "question")
        exam6.setValue("Arunachal Pradesh", forKey: "option1")
        exam6.setValue("Haryana", forKey: "option2")
        exam6.setValue("Madhya Pradesh", forKey: "option3")
        exam6.setValue("asam", forKey: "option4")
        exam6.setValue("Madhya Pradesh", forKey: "answer")
        
            // 4
            do {
                try managedContext.save()
                PreferenceUtils.setIsDataAvailable(state: true)
            } catch let error as NSError {
                print("Could not save. \(error), \(error.userInfo)")
            }
    }
    
    func fetchQuestions(){
        guard let appDelegate =
            UIApplication.shared.delegate as? AppDelegate else {
                return
        }
        
        let managedContext =
            appDelegate.persistentContainer.viewContext
        
        //2
        let fetchRequest =
            NSFetchRequest<NSManagedObject>(entityName: "ExamModel")
        
        //3
        do {
            questions = try managedContext.fetch(fetchRequest)
        } catch let error as NSError {
            print("Could not fetch. \(error), \(error.userInfo)")
        }
    }
    
    func setExamData(position:Int){
        let examQuestion = questions[position]
        labelQuestion?.text =
            examQuestion.value(forKeyPath: "question") as? String
        
        btnOption1.setTitle( examQuestion.value(forKeyPath: "option1") as? String, for: .normal)
        
        btnOption2.setTitle( examQuestion.value(forKeyPath: "option2") as? String, for: .normal)
        
        btnOption3.setTitle( examQuestion.value(forKeyPath: "option3") as? String, for: .normal)
        
        btnOption4.setTitle( examQuestion.value(forKeyPath: "option4") as? String, for: .normal)
    }
    
    func setButtonSelector(option:Int){
        
        AppUtils.setButtonBorder(button: btnOption1,btnColor: UIColor.lightGray.cgColor,boarderColor: UIColor.lightGray.cgColor,cornerRadious: 5,boarderWidth: 0)
        
        AppUtils.setButtonBorder(button: btnOption2,btnColor: UIColor.lightGray.cgColor,boarderColor: UIColor.lightGray.cgColor,cornerRadious: 5,boarderWidth: 0)
        
        AppUtils.setButtonBorder(button: btnOption3,btnColor: UIColor.lightGray.cgColor,boarderColor: UIColor.lightGray.cgColor,cornerRadious: 5,boarderWidth: 0)
        
        AppUtils.setButtonBorder(button: btnOption4,btnColor: UIColor.lightGray.cgColor,boarderColor: UIColor.lightGray.cgColor,cornerRadious: 5,boarderWidth: 0)
        
        
        switch option {
        case 1:
            AppUtils.setButtonBorder(button: btnOption1,btnColor: UIColor.green.cgColor,boarderColor: UIColor.green.cgColor,cornerRadious: 5,boarderWidth: 0)
        case 2:
            AppUtils.setButtonBorder(button: btnOption2,btnColor: UIColor.green.cgColor,boarderColor: UIColor.green.cgColor,cornerRadious: 5,boarderWidth: 0)
        case 3:
            AppUtils.setButtonBorder(button: btnOption3,btnColor: UIColor.green.cgColor,boarderColor: UIColor.green.cgColor,cornerRadious: 5,boarderWidth: 0)
        case 4:
            AppUtils.setButtonBorder(button: btnOption4,btnColor: UIColor.green.cgColor,boarderColor: UIColor.green.cgColor,cornerRadious: 5,boarderWidth: 0)
        default:
            print("asdasd")
        }
        
       
    }
    
}
