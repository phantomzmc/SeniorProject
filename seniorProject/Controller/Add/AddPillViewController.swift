//
//  AddPillViewController.swift
//  seniorProject
//
//  Created by iThunnathorn  on 19/2/2561 BE.
//  Copyright © 2561 Thannathrn Yuwasin. All rights reserved.
//

import UIKit
import FirebaseDatabase
import FirebaseAuth

class AddPillViewController: UIViewController,UIPickerViewDataSource,UIPickerViewDelegate {
    
    var ref = Database.database().reference()
    var aunthListener : AuthStateDidChangeListenerHandle?
    
    @IBOutlet weak var namepillTextField : UITextField!
    @IBOutlet weak var eakLabel : UILabel!
    @IBOutlet weak var timeLabel : UILabel!
    @IBOutlet weak var eakPicker : UIPickerView!
    @IBOutlet weak var timePicker : UIPickerView!
    
    let eakTime = ["ก่อนอาหาร","หลังอาหาร"]
    let time : [String]  = ["ตอนเช้า","กลางวัน","เย็น","ก่อนนอน"]

    override func viewDidLoad() {
        super.viewDidLoad()
        eakPicker.delegate = self
        eakPicker.dataSource = self
        timePicker.delegate = self
        timePicker.dataSource = self
        

        // Do any additional setup after loading the view.
    }
    
//    func numberOfComponentsInPickerView(in pickerView: UIPickerView) -> Int {
//        return 1
//    }
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    // The number of rows of data
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if(pickerView == eakPicker) {
            return eakTime.count
        }
        else {
            return time.count
        }
        
    }
    
    // The data to return for the row and component (column) that's being passed in
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if(pickerView == eakPicker) {
            return eakTime[row]
        }else {
            return time[row]
        }
        
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if(pickerView == eakPicker) {
            if(row == 0) {
                print("ก่อนอาหาร")
                eakLabel.text = eakTime [0]
            }else {
                print("หลังอาหาร")
                eakLabel.text = eakTime [1]
            }
        }else if (pickerView == timePicker) {
            if (row == 0){
                print("ตอนเช้า")
                timeLabel.text = time [0]
            }else if (row == 1){
                print("กลางวัน")
                timeLabel.text = time [1]
            }else if (row == 2) {
                print("เย็น")
                timeLabel.text = time [2]
            }else if (row == 3){
                print("ก่อนนอน")
                timeLabel.text = time [3]
            }
        }
    }
    
    @IBAction func addDataPill (sender : Any) {
        let displayname = Auth.auth().currentUser?.displayName
        let namePill = self.namepillTextField.text
        let eakPill = self.eakLabel.text
        let timePill = self.timeLabel.text

        self.ref = Database.database().reference(withPath:"Member")
        let addPill = PillData (namePill: namePill!, eakPill: eakPill!, timePill: timePill!)
        let addPillRef = self.ref.child(displayname!).child("PillData").childByAutoId()
        addPillRef.setValue(addPill.toAnyObject())
        let alert = UIAlertController(title: "สำเร็จ", message: (namePill), preferredStyle: .alert)
        let resultAlert = UIAlertAction(title: "OK", style: .default , handler: { (alertAction) in
            self.navigationController?.popViewController(animated: true)
        })
        alert.addAction(resultAlert)
        self.present(alert, animated: true, completion: nil)
        return
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
