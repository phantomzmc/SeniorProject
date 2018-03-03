//
//  PillShowTableViewController.swift
//  seniorProject
//
//  Created by iThunnathorn  on 20/2/2561 BE.
//  Copyright © 2561 Thannathrn Yuwasin. All rights reserved.
//

import UIKit
import FirebaseDatabase
import FirebaseAuth

class PillShowViewController: UIViewController,UITableViewDelegate,UITableViewDataSource{
    
    var dataPill = [PillData]()
    
    @IBOutlet weak var pillTableView : UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        pillTableView.delegate = self
        pillTableView.dataSource = self

        loadFirebase()

        }
        func loadFirebase () {
            let displayname = Auth.auth().currentUser?.displayName
            print(displayname)
            Database.database().reference().child("Member").child(displayname!).child("PillData").observe(.childAdded) { (snapshot : DataSnapshot) in
                if let dict = snapshot.value as? [String:Any]{
                    let namePillText = dict ["namePill"] as! String
                    let eakPillText = dict["eakPill"] as! String
                    let timePillText = dict["timePill"] as! String
                    let datapill = PillData(namePill: namePillText, eakPill: eakPillText, timePill: timePillText)
                    self.dataPill.append(datapill)
                    print(self.dataPill)
                    self.pillTableView.reloadData()
                }
//                print(snapshot.value)
                
        }
    
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return dataPill.count
    }


    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellPill", for: indexPath) as? PillTableViewCell
        cell?.namePill.text = dataPill[indexPath.row].namePill
        cell?.eakPill.text = dataPill[indexPath.row].eakPill
        cell?.timePill.text = dataPill[indexPath.row].timePill
        return cell!
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let alert = UIAlertController(title: dataPill[indexPath.row].namePill,
                                      message: "รับประทาน : " + dataPill[indexPath.row].eakPill +  "\nเวลา : " + dataPill[indexPath.row].timePill,
                                      preferredStyle: UIAlertControllerStyle.alert)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }

}
