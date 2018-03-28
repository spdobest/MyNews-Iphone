//
//  TableViewCellNews.swift
//  MyNews App
//
//  Created by sibaprasad on 28/03/18.
//  Copyright © 2018 SP inc. All rights reserved.
//

import Foundation
import UIKit
class TableViewCell: UITableViewCell  { 
    @IBOutlet var imageViewNews: UIImageView!
    @IBOutlet var labelDesc: UILabel!
    
    @IBOutlet var labelTitle: UILabel!
    override func awakeFromNib() {
            super.awakeFromNib()
            // Initialization code
        }
        
        override func setSelected(_ selected: Bool, animated: Bool) {
            super.setSelected(selected, animated: animated)
            
            // Configure the view for the selected state
        }
        
    
}
