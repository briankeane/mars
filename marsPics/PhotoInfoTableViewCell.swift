//
//  PhotoInfoTableViewCell.swift
//  marsPics
//
//  Created by Barry Keane on 9/11/17.
//  Copyright © 2017 Brian D Keane. All rights reserved.
//

import UIKit

class PhotoInfoTableViewCell: UITableViewCell {

  
  @IBOutlet weak var cameraNameLabel: UILabel!
  
  @IBOutlet weak var idLabel: UILabel!
  
  @IBOutlet weak var photoImageView: UIImageView!
  
  
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
