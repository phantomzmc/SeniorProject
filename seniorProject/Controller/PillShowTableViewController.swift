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


    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
