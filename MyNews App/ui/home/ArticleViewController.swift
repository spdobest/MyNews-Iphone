//
//  ArticleViewController.swift
//  IPL
//
//  Created by sibaprasad on 16/03/18.
//  Copyright © 2018 SP infotech. All rights reserved.
//

import Foundation
import UIKit
class ArticleViewController : BaseviewController,UITableViewDataSource {
    
    @IBOutlet var myTable: UITableView!
    
    let images = ["bear.jpeg","camel.jpeg","goat.jpeg","leopard.jpg","lion.jpg","panda.jpg","puppy.jpeg","rabit.jpeg","zebra.jpeg","ziraf.jpeg"]
    var imageArray = [UIImage]()
    
    
     var articles:[Article] = [Article]()
    
    override func viewDidLoad() {
        //  labelMessage.text = myValue
      //  view.addSubview(myActivityIndicator)
        self.myTable.separatorStyle = UITableViewCellSeparatorStyle.none
        parseBlog()
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
        
        
    }
    
    func parseBlog() {
        
//        self.view.addSubview(progressHud)
//        progressHud.show()
        
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
            
            
            print("blog title: \(blog.title)")
            print("blog home: \(blog.homepageURL)")
            
            print("articles:")
         //   self.articles = blog.articles
            self.articles.append(contentsOf: blog.articles)
            for article in blog.articles {
                print("- \(article.title)")
            }
           //  self.myTable.reloadData()
            DispatchQueue.main.async {
                self.hideProgress()
                self.myTable.reloadData()
            }
            
           // self.myTable.reloadData()
            
            }.resume()
    }
    
    /**
     ALL TABLE VIEW RELATED METHODS`
     */
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.articles.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        let cell : ArticleTableViewCell! = tableView.dequeueReusableCell(withIdentifier: "myCell") as? ArticleTableViewCell
    
        if(indexPath.row == articles.count-1){
            self.showProgressDialog("Loading...")
            parseBlog()
        }
        
        cell.labelTitle.text = self.articles[indexPath.row].title
      //  cell.imageview.image = imageArray[indexPath.row%9] //self.articles[indexPath.row].id
        
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

extension ArticleViewController : UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
}

