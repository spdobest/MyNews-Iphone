//
//  HomeViewController.swift
//  MyNews App
//
//  Created by sibaprasad on 25/03/18.
//  Copyright © 2018 SP inc. All rights reserved.
//

import Foundation
import UIKit
import Alamofire

class HomeViewController : BaseviewController{
    var apputil = AppUtils()
    var newsList:[NewsData] = [NewsData]()
    override func viewDidLoad() {
        
        UIApplication.shared.statusBarStyle = .lightContent
        
        // Make Nav Bar Translucent and Set title font/color
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.isTranslucent = true
        self.navigationController?.view.backgroundColor = .clear
        self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedStringKey.foregroundColor: UIColor.white, NSAttributedStringKey.font: UIFont.systemFont(ofSize: 20, weight: .semibold)]
        
        
        initView()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.navigationBar.barTintColor = UIColor.red
        self.navigationController?.navigationBar.tintColor = UIColor.red
    }
    func initView() {
       // getNewsList()
    }
    
    func getNewsList() {
        
        //        self.view.addSubview(progressHud)
        //        progressHud.show()
        
        showProgressDialog("Loading...")
        
        let urlContacts = "http://veergurudev.com/App/API/head_news.php?uid=1442"
        guard let gitUrl = URL(string: urlContacts) else { return }
        
        
        URLSession.shared.dataTask(with: gitUrl) { (data, response
            , error) in
            
            guard let data = data else {
                print("Error: No data to decode")
                return
            }
            
            guard let blog = try? JSONDecoder().decode(NewsResponse.self, from: data) else {
                print("Error: Couldn't decode data into Blog")
                return
            }
            
           
            
            for article in blog.data! {
                print("- \(article.title)")
            }
            //  self.myTable.reloadData()
            DispatchQueue.main.async {
                self.hideProgress()
               // self.myTable.reloadData()
            }
            
            // self.myTable.reloadData()
            
            }.resume()
    }
    
}
