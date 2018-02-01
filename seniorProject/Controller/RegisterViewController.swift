//
//  RegisterViewController.swift
//  seniorProject
//
//  Created by Thannathrn Yuwasin on 27/12/2560 BE.
//  Copyright © 2560 Thannathrn Yuwasin. All rights reserved.
//

import UIKit
import FirebaseAuth
import FirebaseDatabase

class RegisterViewController: UIViewController {
    var ref = DatabaseReference()
    
    @IBOutlet weak var viewRegis: UIView!
    @IBOutlet weak var usernameTextfied : UITextField!
    @IBOutlet weak var passwordTextfied : UITextField!
    @IBOutlet weak var confirmPasswordTextfied : UITextField!
    @IBOutlet weak var userTextfied : UITextField!
    @IBOutlet weak var ageTextfied : UITextField!
    @IBOutlet weak var DATextfied : UITextField!
    @IBOutlet weak var pillTextfied : UITextField!
    @IBOutlet weak var telTextfied : UITextField!
    @IBOutlet weak var sosUserTextfied : UITextField!
    @IBOutlet weak var sosTelTextfied : UITextField!

    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.

    }

    @IBAction func submitRegister(_ sender: Any) {
        if (usernameTextfied.text!.characters.count < 8) {
            usernameTextfied?.backgroundColor = UIColor (red: 235/255, green: 192/255, blue: 123/255, alpha: 1)
            Const().ShowAlert(title: "เกิดข้อผิดพลาด", messeage: "Email ต้องมีตัวอักษรมากกว่า 8 ตัว", viewController: self)
            return
        }
        else {
            usernameTextfied?.backgroundColor = UIColor.white
        }
        if ((passwordTextfied.text?.characters.count)! < 8) {
            passwordTextfied.backgroundColor = UIColor (red: 235/255, green: 192/255, blue: 123/255, alpha: 1)
            Const().ShowAlert(title: "เกิดข้อผิดพลาด", messeage: "Password ต้องมีตัวอักษรมากกว่า 8 ตัว", viewController: self)
            return
        }
        else {
            passwordTextfied.backgroundColor = UIColor.white
        }
        if  !(confirmPasswordTextfied.text?.isEqual(passwordTextfied.text))!{
            confirmPasswordTextfied.backgroundColor = UIColor (red: 235/255, green: 192/255, blue: 123/255, alpha: 1)
            Const().ShowAlert(title: "เกิดข้อผิดพลาด", messeage: "กรุณากรอก Password ให้ถูกต้อง", viewController: self)
            return
        }else {
            confirmPasswordTextfied?.backgroundColor = UIColor.white
            
            let email = usernameTextfied.text
            let password = passwordTextfied.text
            let username = userTextfied.text
            let age = ageTextfied.text
            let DA = DATextfied.text
            let pill = pillTextfied.text
            let tel = telTextfied.text
            let sosUser = sosUserTextfied.text
            let sosTel = sosTelTextfied.text
            
            
            Auth.auth().createUser(withEmail: email!, password: password!, completion: { (firebaseUser, firebaseError) in
                if let error = firebaseError {
                    Const().ShowAlert(title: "เกิดข้อผิดพลาด", messeage: error.localizedDescription, viewController: self)
                    return
                }else {
                    self.ref = Database.database().reference(withPath:"Member")
                    let registerData = RegisterData (email: email!, username: username!, age: age!, DA: DA!, pill: pill!, tel: tel!, sosUser: sosUser!, sosTel: sosTel!)
                    let registerRef = self.ref.child(username!).child("Profile")
                    registerRef.setValue(registerData.toAnyObject())
                    let alert = UIAlertController(title: "สำเร็จ", message: "สมัครสมาชิกสำเร็จ", preferredStyle: .alert)
                    let resultAlert = UIAlertAction(title: "OK", style: .default , handler: { (alertAction) in
                        self.navigationController?.popViewController(animated: true)
                    })
                    alert.addAction(resultAlert)
                    self.present(alert, animated: true, completion: nil)
                    return
                }
            })
            
        }
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
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
