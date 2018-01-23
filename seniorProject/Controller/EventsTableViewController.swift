//
//  EventsTableViewController.swift
//  seniorProject
//
//  Created by Thannathrn Yuwasin on 7/1/2561 BE.
//  Copyright © 2561 Thannathrn Yuwasin. All rights reserved.
//

import UIKit


class EventsTableViewController: UITableViewController {
    @IBOutlet weak var eventTableView : UITableView!
    let eventName : [String] = ["กายภาพบำบัด","ตรวจเลือด","กินข้าวนอกบ้าน","ตรวจสุขภาพประจำปี"]
    let eventDate : [Int] = [22,25,1,10]
    let eventDetail : [String] = ["รับปริญญาที่ มช","รพ.สวนดอก","รพ.ราม","ไม่ได้กำหนด"]
    let eventmonth : [String] = ["มกราคม","มกราคม","กุมภาพันธ์","มีนาคม"]
    let eventPic : [String] = ["1.jpg","2.jpg","3.jpg","4.jpg"]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        eventTableView.delegate = self
        eventTableView.dataSource = self
        
    }
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    
    

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
        return eventName.count
    }


    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "EventCell", for: indexPath) as? EventsTableViewCell
//        let dictShow = eventArr[indexPath.row]
        cell?.eventDateLabel.text = "\(eventDate[indexPath.row])"
        cell?.eventNameLabel.text = eventName[indexPath.row]
        cell?.eventDetailLabel.text = eventDetail[indexPath.row]
        cell?.eventMonthLabel.text = eventmonth[indexPath.row]
        cell?.eventImageView.image = UIImage(named:self.eventPic[indexPath.row])

//        if indexPath.row % 2 == 0 {
//            cell?.eventImageView.image = UIImage("")
//        }

        // Configure the cell...

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
