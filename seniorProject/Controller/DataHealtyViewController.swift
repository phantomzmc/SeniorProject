//
//  DataHealtyViewController.swift
//  seniorProject
//
//  Created by iThunnathorn  on 1/20/2561 BE.
//  Copyright © 2561 Thannathrn Yuwasin. All rights reserved.
//

import UIKit
import FirebaseDatabase
import FirebaseAuth

class DataHealtyViewController: UIViewController {
    
    var ref = Database.database().reference()
    
    @IBOutlet weak var viewHeigh : UIView?
    @IBOutlet weak var viewWeigth : UIView?
    @IBOutlet weak var viewCA : UIView?
    @IBOutlet weak var viewPill : UIView?

    @IBOutlet weak var weigthLabel : UILabel!
    @IBOutlet weak var heigthLabel : UILabel!
    @IBOutlet weak var pillSafeLabel : UILabel!
    @IBOutlet weak var hospitalLabel : UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewCA?.layer.cornerRadius = 25
        viewPill?.layer.cornerRadius = 25
        viewHeigh?.layer.cornerRadius = 25
        viewWeigth?.layer.cornerRadius = 25
        
        let displayname = Auth.auth().currentUser?.displayName
        ref.child("Member").child(displayname!).child("Health").observeSingleEvent(of:
            .value, with: { (snapshot) in

                let value = snapshot.value as? NSDictionary
                let weigth = value?["weigth"] as? String ?? ""
                let higth = value?["higth"] as? String ?? ""
                let pillSafe = value?["pillsafe"] as? String ?? ""
                let hospital = value?["hospital"] as? String ?? ""

                print("weigth:" + (weigth))
                print("higth:" + (higth))
                print("pillSafe:" + (pillSafe))
                print("hospital:" + (hospital))


                self.weigthLabel.text = weigth
                self.heigthLabel.text = higth
                self.pillSafeLabel.text = pillSafe
                self.hospitalLabel.text = hospital


        })
//        func CalBMI () {
//            var calWeigth: Int? = Int(weigthLabel.text!)
//            var calHeigth: Int? = Int(heigthLabel.text!)
//            var calbmi = calWeigth!/(calHeigth!*calHeigth!)
//            print(calbmi)
//        }
        
        

        

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
