//
//  PostTableViewCell.swift
//  Swiftagram
//
//  Created by Rachel Stevenson on 11/24/15.
//  Copyright © 2015 rachelrockaway. All rights reserved.
//

import UIKit
import Parse
import Bolts
import ParseUI

class PostTableViewCell: UITableViewCell {
    
    
    @IBOutlet weak var postImageView: PFImageView!
    @IBOutlet weak var postCaption: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    

}
