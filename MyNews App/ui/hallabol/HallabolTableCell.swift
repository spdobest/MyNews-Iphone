//
//  HallabolTableCell.swift
//  MyNews App
//
//  Created by sibaprasad on 01/04/18.
//  Copyright © 2018 SP inc. All rights reserved.
//

import Foundation
import UIKit
class HallabolTableCell:  UITableViewCell  {
    
    
    @IBOutlet var imageViewHallabol: UIImageView!
    
    @IBOutlet var titleHallabol: UILabel!
    
    @IBOutlet var descHallabol: UILabel!
    
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    
}
