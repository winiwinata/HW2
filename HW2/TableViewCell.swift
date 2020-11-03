//
//  TableViewCell.swift
//  HW2
//
//  Created by WiseLab-HP on 2020/11/3.
//  Copyright © 2020 NDHU_CSIE. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {

    @IBOutlet var myLabel:UILabel!
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var priceLabel: UILabel!
    @IBOutlet var total: UILabel!
    @IBOutlet var thumbnailImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
