//
//  LoginViewController.swift
//  seniorProject
//
//  Created by Thannathrn Yuwasin on 17/12/2560 BE.
//  Copyright © 2560 Thannathrn Yuwasin. All rights reserved.
//

import UIKit
import FirebaseAuth

class LoginViewController: UIViewController {
    

    @IBOutlet weak var emailEditText: UITextField!
    @IBOutlet weak var passwordEditText: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func LoginClick(_ sender: Any) {
        if (emailEditText.text!.characters.count < 8) {
            emailEditText?.backgroundColor = UIColor (red: 235/255, green: 192/255, blue: 123/255, alpha: 1)
            Const().ShowAlert(title: "เกิดข้อผิดพลาด", messeage: "Email ต้องมีตัวอักษรมากกว่า 8 ตัว", viewController: self)
            return
        }
        else {
            emailEditText?.backgroundColor = UIColor.white
        }
        if ((passwordEditText.text?.characters.count)! < 8) {
            passwordEditText.backgroundColor = UIColor (red: 235/255, green: 192/255, blue: 123/255, alpha: 1)
            Const().ShowAlert(title: "เกิดข้อผิดพลาด", messeage: "Password ต้องมีตัวอักษรมากกว่า 8 ตัว", viewController: self)
            
        }
        else {
            passwordEditText.backgroundColor = UIColor.white
        }
        let email = emailEditText.text
        let password = passwordEditText.text
        
        Auth.auth().signIn(withEmail: email!, password: password!) { (firebaseUser, firebaseError) in
            if let error = firebaseError {
                Const().ShowAlert(title: "เกิดข้อผิดพลาด", messeage: error.localizedDescription, viewController: self)
                return
            
        
            }else {
                let alert = UIAlertController(title: "ยินดีต้อนรับ", message: "Email : " + (email)!, preferredStyle: .alert)
                let resultAlert = UIAlertAction(title: "OK", style: .default, handler: { (alertAction) in
                    
                })
                alert.addAction(resultAlert)
                self.dismiss(animated: true, completion: nil)
                return
            }
        }
        
    }
    
    @IBAction func RegisterClick(_ sender: UIStoryboardSegue) {
    }
    
    @IBAction func ForgetPasswordClick(_ sender: Any) {
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
