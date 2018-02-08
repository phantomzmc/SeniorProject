//
//  EditProfileViewController.swift
//  seniorProject
//
//  Created by iThunnathorn  on 1/22/2561 BE.
//  Copyright © 2561 Thannathrn Yuwasin. All rights reserved.
//

import UIKit
import FirebaseDatabase
import FirebaseAuth

class EditProfileViewController: UIViewController {
    
    var dataReference : DatabaseReference?
    
    var fullname : String = ""
    var gen : String = ""
    var age : String = ""
    var da : String = ""
    var pill : String = ""
    

    @IBOutlet weak var fullnameTextField: UITextField!
    @IBOutlet weak var genTextField: UITextField!
    @IBOutlet weak var ageTextField: UITextField!
    @IBOutlet weak var daTextField: UITextField!
    @IBOutlet weak var pillTextField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        


        // Do any additional setup after loading the view.
    }

    @IBAction func submitEditProfileCilck(_ sender: Any) {
        let displayname = Auth.auth().currentUser?.displayName
        print(displayname!)
        
        fullname = fullnameTextField.text!
        gen = genTextField.text!
        age = ageTextField.text!
        da = daTextField.text!
        pill = pillTextField.text!
        
        dataReference = Database.database().reference()
        dataReference?.child("Member").child(displayname!).child("Profile").child("name").setValue(fullname)
        dataReference?.child("Member").child(displayname!).child("Profile").child("gen").setValue(gen)
        dataReference?.child("Member").child(displayname!).child("Profile").child("age").setValue(age)
        dataReference?.child("Member").child(displayname!).child("Profile").child("DA").setValue(da)
        dataReference?.child("Member").child(displayname!).child("Profile").child("pill").setValue(pill)




        
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
