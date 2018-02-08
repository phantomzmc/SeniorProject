//
//  SOSViewController.swift
//  seniorProject
//
//  Created by Thannathrn Yuwasin on 5/1/2561 BE.
//  Copyright © 2561 Thannathrn Yuwasin. All rights reserved.
//

import UIKit
//import FirebaseDatabase
import FirebaseAuth


class SOSViewController: UIViewController {
    
//    let ref = Database.database().reference()
    

    @IBOutlet weak var SOSbuntton: UIButton!
    @IBOutlet weak var Telbutton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        SOSbuntton.layer.cornerRadius = 100
        
        Telbutton.layer.cornerRadius = 100
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func SOSbutton (sender : Any) {
        if let phoneCallURL = URL(string: "tel://1669") {
            
            let application:UIApplication = UIApplication.shared
            if (application.canOpenURL(phoneCallURL)) {
                application.open(phoneCallURL, options: [:], completionHandler: nil)
            }
        }
        
    }
    @IBAction func Telbutton (sender : Any) {
        
        let phoneNumber = 0903198808
        if let phoneCallURL = URL(string: "tel://\(phoneNumber)") {
            
            let application:UIApplication = UIApplication.shared
            if (application.canOpenURL(phoneCallURL)) {
                application.open(phoneCallURL, options: [:], completionHandler: nil)
            }
        }
//        let displayname = Auth.auth().currentUser?.displayName
//        ref.child("Member").child(displayname!).child("Profile").child("sosTel").observeSingleEvent(of:
//            .value, with: { (snapshot) in
//
//                let value = snapshot.value as? NSDictionary
//                let SOStel = value?["sosTel"] as? String ?? ""
//
//                let phoneNumber = SOStel
//                if let phoneCallURL = URL(string: "tel://\(phoneNumber)") {
//
//                    let application:UIApplication = UIApplication.shared
//                    if (application.canOpenURL(phoneCallURL)) {
//                        application.open(phoneCallURL, options: [:], completionHandler: nil)
//                    }
//                }
//        })
        
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
