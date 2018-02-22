//
//  DetailEventViewController.swift
//  seniorProject
//
//  Created by Thannathrn Yuwasin on 7/1/2561 BE.
//  Copyright © 2561 Thannathrn Yuwasin. All rights reserved.
//

import UIKit

import Kingfisher


class DetailEventViewController: UIViewController {
    
//    var event:EventData!
    
    @IBOutlet weak var detailEventDate : UILabel!
    @IBOutlet weak var detailEventName : UILabel!
    @IBOutlet weak var detailEventMonth : UILabel!
    @IBOutlet weak var detailEventDetail : UILabel!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        detailEventMonth?.text = "event.eventMonth"
        detailEventName?.text = "event.eventName"
        detailEventDate?.text = ""
        detailEventDetail?.text = "event.eventDetail"
        
//        if let eventPic = event.eventPic {
//            detailEventPic?.kf.setImage(with: URL(string:eventPic))
//        }else{
//            detailEventPic?.image = UIImage(named: "1.jpg")
//        }
        

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

