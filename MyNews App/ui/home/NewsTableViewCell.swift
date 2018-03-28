//
//  ArticleTableViewCell.swift
//  IPL
//
//  Created by sibaprasad on 16/03/18.
//  Copyright © 2018 SP infotech. All rights reserved.
//

import UIKit

class NewsTableViewCell: UITableViewCell {
    
    @IBOutlet var imageViewNews: UIImageView!
    
    @IBOutlet var labelDesc: UILabel!
    @IBOutlet var labelNewsTitle: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
