//
//  ProfileViewController.swift
//  seniorProject
//
//  Created by Thannathrn Yuwasin on 5/1/2561 BE.
//  Copyright © 2561 Thannathrn Yuwasin. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController {
    
    var profilecontainer : ProfileContainerViewController!
//    @IBOutlet var avatarImage : UIImageView!
    @IBOutlet weak var profileSegmentControl: UISegmentedControl!
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        avatarImage.layer.cornerRadius =  50

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func controlProfile(_ sender: Any) {
        if(profileSegmentControl?.selectedSegmentIndex == 0)
        {
            profilecontainer.segueIdentifierReceivedFromParent("showprofile")
        }
        else if(profileSegmentControl?.selectedSegmentIndex == 1)
        {
            profilecontainer.segueIdentifierReceivedFromParent("editprofile")
        }
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "profilecontainer"{
            self.profilecontainer =  segue.destination as! ProfileContainerViewController
        }

    }
//
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
