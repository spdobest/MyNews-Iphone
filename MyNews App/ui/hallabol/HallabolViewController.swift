//
//  HallabolViewController.swift
//  MyNews App
//
//  Created by sibaprasad on 01/04/18.
//  Copyright © 2018 SP inc. All rights reserved.
//

import Foundation
import UIKit
import Alamofire
class HallabolViewController: BaseviewController,UITableViewDataSource {
    
    @IBOutlet var hallabolTableView: UITableView!
    
    
    var articles:[Article] = [Article]()
    var newsList:[HallabolData] = [HallabolData]()
    
    override func viewDidLoad() {
        //  labelMessage.text = myValue
        //  view.addSubview(myActivityIndicator)
    //    self.hallabolTableView.separatorStyle = UITableViewCellSeparatorStyle.none
        getNews()
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
        
        
    }
    
    func getNews() {
        
        let parameters: Parameters = ["uid": PreferenceUtils.getUserID()]
        
        Alamofire.request( UrlConstants.API_HALLABOL,method: .get, parameters: parameters)
            .responseJSON { response in
                
                //    print(response.request )  // original URL request
                //  print(response.response) // URL response
                //    print(response.data)     // server data
                //  print(response.result)   // result of response serialization
                
                
                do {
                    if let JSON = response.result.value {
                        print("JSON: \(JSON)")
                        let newsResponse =  try JSONDecoder().decode(HallabolResponse.self, from: response.data!)
                        print("JSON firt Item : \(newsResponse.result![0])")
                        
                        for newsData in newsResponse.result!{
                            self.newsList.append(newsData)
                        }
                        DispatchQueue.main.async {
                            self.hideProgress()
                            self.hallabolTableView.reloadData()
                        }
                        
                    }
                    
                }
                catch let error as NSError {
                    print(error.localizedDescription)
                }
        }
    }
    
    
    func parseBlog() {
        
        showProgressDialog("Loading...")
        
        let urlContacts = "http://roadfiresoftware.com/feed/json"
        guard let gitUrl = URL(string: urlContacts) else { return }
        
        let parameters = ["id": "12234353"]
        var request = URLRequest(url: gitUrl)
        request.httpMethod = "POST"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        guard let httpBody = try? JSONSerialization.data(withJSONObject: parameters, options: []) else { return }
        request.httpBody = httpBody
        
        
        URLSession.shared.dataTask(with: gitUrl) { (data, response
            , error) in
            
            guard let data = data else {
                print("Error: No data to decode")
                return
            }
            
            guard let blog = try? JSONDecoder().decode(Blog.self, from: data) else {
                print("Error: Couldn't decode data into Blog")
                return
            }
            
            self.articles.append(contentsOf: blog.articles)
            
            DispatchQueue.main.async {
                self.hideProgress()
                self.hallabolTableView.reloadData()
            }
            }.resume()
    }
    
    /**
     ALL TABLE VIEW RELATED METHODS`
     */
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.newsList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        let cell : HallabolTableCell! = tableView.dequeueReusableCell(withIdentifier: "hallabolCell") as? HallabolTableCell
        
        if(indexPath.row == articles.count-1){
            self.showProgressDialog("Loading...")
            getNews()
        }
        
        cell.titleHallabol.text = self.newsList[indexPath.row].title
        cell.descHallabol.text = self.newsList[indexPath.row].description
       downloadImage(self.newsList[indexPath.row].image!,inView: cell.imageViewHallabol)
        
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let storyboard = UIStoryboard(name:"Main",bundle:nil)
        
//        let dvc = storyboard.instantiateViewController(withIdentifier: "newsDetails") as! NewsDetailsVc
//
//        dvc.getTitle = newsList[indexPath.row].title!
//        dvc.getDesc = newsList[indexPath.row].description!
//        dvc.getImageUrl = newsList[indexPath.row].newsimage!
//        dvc.getDate = newsList[indexPath.row].uploadedDate!
//        dvc.getLikeCount = newsList[indexPath.row].likecnt!
//
//        self.navigationController?.pushViewController(dvc, animated: true)
    }
    
    
    
}

func downloadImageNew(_ uri : String, inView: UIImageView){
    
    let url = URL(string: uri)
    
    let task = URLSession.shared.dataTask(with: url!) {responseData,response,error in
        if error == nil{
            if let data = responseData {
                
                DispatchQueue.main.async {
                    inView.image = UIImage(data: data)
                }
                
            }else {
                print("no data")
            }
        }else{
            print(error)
        }
    }
    
    task.resume()
}
extension HallabolViewController : UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    
}

