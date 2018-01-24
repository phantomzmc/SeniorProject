//
//  EventsTableViewCell.swift
//  seniorProject
//
//  Created by Thannathrn Yuwasin on 7/1/2561 BE.
//  Copyright © 2561 Thannathrn Yuwasin. All rights reserved.
//

import UIKit

class EventsTableViewCell: UITableViewCell {
    @IBOutlet weak var eventImageView : UIImageView!
    @IBOutlet weak var eventDateLabel : UILabel!
    @IBOutlet weak var eventMonthLabel : UILabel!
    @IBOutlet weak var eventNameLabel : UILabel!
    @IBOutlet weak var eventDetailLabel : UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        

    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
