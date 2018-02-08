//
//  AddDataHealtyViewController.swift
//  seniorProject
//
//  Created by iThunnathorn  on 2/9/2561 BE.
//  Copyright © 2561 Thannathrn Yuwasin. All rights reserved.
//

import UIKit
import FirebaseDatabase
import FirebaseAuth

class AddDataHealtyViewController: UIViewController {
    
    var ref = Database.database().reference()
    var aunthListener : AuthStateDidChangeListenerHandle?
    
    
    @IBOutlet weak var weightTextFlied : UITextField!
    @IBOutlet weak var heigthTextFlied : UITextField!
    @IBOutlet weak var pillSafeTextFlied : UITextField!
    @IBOutlet weak var hospitalTextFlied : UITextField!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func addDataHealty (sender : Any) {
        let displayname = Auth.auth().currentUser?.displayName
        let weight = self.weightTextFlied.text
        let height = self.heigthTextFlied.text
        let pillSafe = self.pillSafeTextFlied.text
        let hospital = self.hospitalTextFlied.text
        
        self.ref = Database.database().reference(withPath:"Member")
        let addDataBMI = DataBMI (healthWeigth: weight!, healthHigth: height!, healthPillSafe: pillSafe!, healthHospital: hospital!)
        let addDataBMIRef = self.ref.child(displayname!).child("Health")
        addDataBMIRef.setValue(addDataBMI.toAnyObject())
        let alert = UIAlertController(title: "สำเร็จ", message: (weight), preferredStyle: .alert)
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
