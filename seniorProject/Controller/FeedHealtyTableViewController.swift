//
//  FeedHealtyTableViewController.swift
//  seniorProject
//
//  Created by iThunnathorn  on 1/20/2561 BE.
//  Copyright © 2561 Thannathrn Yuwasin. All rights reserved.
//

import UIKit
import Alamofire
import Kingfisher

class FeedHealtyTableViewController: UITableViewController {
    //http://www.mocky.io/v2/5a6987902e0000610f7a74af
    
    var feedhealth : [HealthData] = []
    @IBOutlet weak var feedTableView : UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        Alamofire.request("http://www.mocky.io/v2/5a6987902e0000610f7a74af").responseJSON { response in
            print("Request: \(String(describing: response.request))")   // original url request
            print("Response: \(String(describing: response.response))") // http url response
            print("Result: \(response.result)")                         // response serialization result
            
            if let json = response.result.value {
                print("JSON: \(json)") // serialized json response
                
                let dict:NSDictionary = json as! NSDictionary
                
                let healthArray = dict.object(forKey: "health") as! NSArray
                
                for healthJson in healthArray {
                    let healthDict = healthJson as! NSDictionary
                    let health:HealthData = HealthData(json: healthDict)
                    self.feedhealth.append(health)
                }
                self.feedTableView.reloadData()
                
            }
        }

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return feedhealth.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Feedcell", for: indexPath) as? FeedHealtyTableViewCell
        let health = feedhealth[indexPath.row]
        if let healthName = health.healthName {
            cell?.feedNameLable.text = healthName
        }else{
            cell?.feedNameLable.text = "-"
        }
        if let healthDetail = health.healthDetail{
            cell?.feeddetailLabel.text = healthDetail
        }else{
            cell?.feeddetailLabel.text = "-"
        }
        if let healthImageView = health.healthPic {
            cell?.feedImageView.kf.setImage(with: URL(string:healthImageView))
        }else{
            cell?.feedImageView.image = UIImage(named: "1.jpg")
        }
        
        cell?.feeddetailLabel.text = "รายละเอียด"
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
