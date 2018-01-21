//
//  FeedHealtyTableViewCell.swift
//  seniorProject
//
//  Created by iThunnathorn  on 1/20/2561 BE.
//  Copyright © 2561 Thannathrn Yuwasin. All rights reserved.
//

import UIKit

class FeedHealtyTableViewCell: UITableViewCell {
    @IBOutlet weak var feedImageView : UIImageView!
    @IBOutlet weak var feedNameLable : UILabel!
    @IBOutlet weak var feeddetailLabel : UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
