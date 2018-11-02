//
//  AllStoresCell.swift
//  InstaShop
//
//  Created by Ahmed Mh on 02/11/2018.
//  Copyright © 2018 Ahmed Mh. All rights reserved.
//

import UIKit

class AllStoresCell: UITableViewCell {

    @IBOutlet weak var StoreIcon: UIImageView!
    @IBOutlet weak var StoreName: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
