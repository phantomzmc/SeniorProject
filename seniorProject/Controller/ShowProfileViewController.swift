//
//  ShowProfileViewController.swift
//  seniorProject
//
//  Created by iThunnathorn  on 1/22/2561 BE.
//  Copyright © 2561 Thannathrn Yuwasin. All rights reserved.
//

import UIKit
import FirebaseDatabase
import FirebaseAuth

class ShowProfileViewController: UIViewController {
    

    var dataProfile = [RegisterData]()
    let ref = Database.database().reference()
    
    @IBOutlet var avatarImage : UIImageView!
    @IBOutlet weak var fullnameLabel: UILabel!
    @IBOutlet weak var ageLabel: UILabel!
    @IBOutlet weak var genLabel: UILabel!
    @IBOutlet weak var daLabel: UILabel!
    @IBOutlet weak var pillLabel: UILabel!
    @IBOutlet weak var homeLabel : UILabel!
    @IBOutlet weak var sosUserLabel : UILabel!
    @IBOutlet weak var sosTelLabel : UILabel!

    
    func fetchData (){
        ref.observeSingleEvent(of: .value) { (snapshot) in
            var dataArr = [RegisterData]()
            for item in snapshot.children {
                let cateData = RegisterData(snapshot : item as! DataSnapshot)
                dataArr.append(cateData)
            }
            self.dataProfile = dataArr
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        let event = eventsdata[indexPath.row]
//        if let eventname = event.eventName {
//            cell?.eventNameLabel.text = eventname

        
        let displayname = Auth.auth().currentUser?.displayName
        ref.child("Member").child(displayname!).child("Profile").observeSingleEvent(of:
            .value, with: { (snapshot) in
                
                let value = snapshot.value as? NSDictionary
                let fullname = value?["username"] as? String ?? ""
                let age = value?["age"] as? String ?? ""
                let gen = value?["tel"] as? String ?? ""
                let da = value?["DA"] as? String ?? ""
                let pill = value?["pill"] as? String ?? ""
                let home = value?["home"] as? String ?? ""
                let sosuser = value?["sosUser"] as? String ?? ""
                let sostel = value?["sosTel"] as? String ?? ""

                print("fullname:" + (fullname))
                print("age:" + (age))
                print("gen:" + (gen))
                print("DA:" + (da))
                print("pill:" + (pill))
                print("home:" + (home))
                print("sosuser:" + (sosuser))
                print("sostel:" + (sostel))
                
                self.fullnameLabel.text = fullname
                self.ageLabel.text = age
                self.genLabel.text = gen
                self.daLabel.text = da
                self.pillLabel.text = pill
                self.homeLabel.text = home
                self.sosUserLabel.text = sosuser
                self.sosTelLabel.text = sostel
                
        })
        
        

        // Do any additional setup after loading the view.
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
