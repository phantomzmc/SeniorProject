//
//  EditProfileViewController.swift
//  seniorProject
//
//  Created by iThunnathorn  on 1/22/2561 BE.
//  Copyright © 2561 Thannathrn Yuwasin. All rights reserved.
//

import UIKit
import FirebaseDatabase

class EditProfileViewController: UIViewController {
    
    var dataReference : DatabaseReference?

    @IBOutlet weak var fullnameTextField: UITextField!
    @IBOutlet weak var genTextField: UITextField!
    @IBOutlet weak var ageTextField: UITextField!
    @IBOutlet weak var daTextField: UITextField!
    @IBOutlet weak var pillTextField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.fullnameTextField.delegate = self as? UITextFieldDelegate


        // Do any additional setup after loading the view.
    }

    @IBAction func submitEditProfileCilck(_ sender: Any) {
        dataReference = Database.database().reference()
        dataReference?.childByAutoId().child("Profile").child("name").setValue(fullnameTextField)
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
