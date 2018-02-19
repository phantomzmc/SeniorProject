//
//  PillTableViewCell.swift
//  seniorProject
//
//  Created by iThunnathorn  on 20/2/2561 BE.
//  Copyright © 2561 Thannathrn Yuwasin. All rights reserved.
//

import UIKit

class PillTableViewCell: UITableViewCell {
    
    @IBOutlet weak var namePill : UILabel!
    @IBOutlet weak var eakPill : UILabel!
    @IBOutlet weak var timePill : UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
