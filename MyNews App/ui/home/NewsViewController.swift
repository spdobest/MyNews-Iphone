//
//  ArticleViewController.swift
//  IPL
//
//  Created by sibaprasad on 16/03/18.
//  Copyright © 2018 SP infotech. All rights reserved.
//

import Foundation
import UIKit
import Alamofire
class NewsViewController : BaseviewController,UITableViewDataSource {
    
    @IBOutlet var myTable: UITableView!
    
    let images = ["bear.jpeg","camel.jpeg","goat.jpeg","leopard.jpg","lion.jpg","panda.jpg","puppy.jpeg","rabit.jpeg","zebra.jpeg","ziraf.jpeg"]
    var imageArray = [UIImage]()
    
    
     var articles:[Article] = [Article]()
     var newsList:[NewsData] = [NewsData]()
    
    override func viewDidLoad() {
        //  labelMessage.text = myValue
      //  view.addSubview(myActivityIndicator)
        self.myTable.separatorStyle = UITableViewCellSeparatorStyle.none
        getNews()
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
        
        
    }
    
    func getNews() {
        
        let parameters: Parameters = ["uid": PreferenceUtils.getUserID()]
        
        Alamofire.request( UrlConstants.API_NEWS,method: .get, parameters: parameters)
            .responseJSON { response in
                
                print(response.request )  // original URL request
                print(response.response) // URL response
                print(response.data)     // server data
                print(response.result)   // result of response serialization
                
                
                do {
                    if let JSON = response.result.value {
                        print("JSON: \(JSON)")
                        let newsResponse =  try JSONDecoder().decode(NewsResponse.self, from: response.data!)
                        print("JSON: \(newsResponse.data![0])")
                        
                        for newsData in newsResponse.data!{
                        self.newsList.append(newsData)
                        }
                                            DispatchQueue.main.async {
                                                self.hideProgress()
                                                self.myTable.reloadData()
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
                self.myTable.reloadData()
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
        
        
        let cell : NewsTableViewCell! = tableView.dequeueReusableCell(withIdentifier: "myCell") as? NewsTableViewCell
    
        if(indexPath.row == articles.count-1){
            self.showProgressDialog("Loading...")
            getNews()
        }
        
        cell.labelNewsTitle.text = self.newsList[indexPath.row].title
        cell.labelDesc.text = self.newsList[indexPath.row].description
        downloadImage(self.newsList[indexPath.row].newsimage!, inView: cell.imageViewNews)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let storyboard = UIStoryboard(name:"Main",bundle:nil)
        
        let dvc = storyboard.instantiateViewController(withIdentifier: "DetailsArticle") as! DetailsArticleVC
        
        
     //   dvc.getImage = imageArray[indexPath.row%9]
        dvc.getName = articles[indexPath.row].title
        var url = articles[indexPath.row].url.absoluteString
        dvc.getUrl = url
        self.navigationController?.pushViewController(dvc, animated: true)
    }
    
}


func downloadImage(_ uri : String, inView: UIImageView){
    
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



extension NewsViewController : UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    
    let url = URL(string: image.url)

DispatchQueue.global().async {
    let data = try? Data(contentsOf: url!) //make sure your image in this url does exist, otherwise unwrap in a if let check / try-catch
    DispatchQueue.main.async {
        imageView.image = UIImage(data: data!)
    }
}
    
    
}

