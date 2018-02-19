//
//  AddEventViewController.swift
//  seniorProject
//
//  Created by iThunnathorn  on 1/31/2561 BE.
//  Copyright © 2561 Thannathrn Yuwasin. All rights reserved.
//

import UIKit
import FirebaseDatabase
import FirebaseAuth

class AddEventViewController: UIViewController {


    var ref = DatabaseReference()
    var authListener: AuthStateDidChangeListenerHandle?
    var userName : String!
    
    @IBOutlet weak var nameEvent : UITextField!
    @IBOutlet weak var detailEvent : UITextField!
    @IBOutlet weak var dateEvent : UITextField!
    @IBOutlet weak var monthEvent : UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()
        Auth.auth().addStateDidChangeListener() { auth, user in
//            let firAuthEmail = Auth.auth().currentUser
//            if firAuthEmail != nil {
//                userName = firAuthEmail
//                print(self.userName)
            let currentUser = Auth.auth().currentUser
            print(currentUser?.displayName)
            
            }
        }


        // Do any additional setup after loading the view.
    
    
    




    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func submitAddEvent (sender : Any){
        let displayname = Auth.auth().currentUser?.displayName
        let nameEvent = self.nameEvent.text
        let detailEvent = self.detailEvent.text
        let dateEvent = self.dateEvent.text
        let monthEvent = self.monthEvent.text
        
        self.ref = Database.database().reference(withPath:"Member")
        let addEventData = AddEvent (nameEvent: nameEvent!, detailEvent: detailEvent!, dateEvent: dateEvent!, monthEvent: monthEvent!)
        let addEventRef = self.ref.child(displayname!).child("Event").child(nameEvent!)
        addEventRef.setValue(addEventData.toAnyObject())
        let alert = UIAlertController(title: "สำเร็จ", message: "เพิ่มรายการสำเร็จ", preferredStyle: .alert)
        let resultAlert = UIAlertAction(title: "OK", style: .default , handler: { (alertAction) in
            self.navigationController?.popViewController(animated: true)
        })
        alert.addAction(resultAlert)
        self.present(alert, animated: true, completion: nil)
        return
        
        
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
