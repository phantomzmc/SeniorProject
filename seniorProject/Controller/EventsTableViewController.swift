//
//  EventsTableViewController.swift
//  seniorProject
//
//  Created by Thannathrn Yuwasin on 7/1/2561 BE.
//  Copyright © 2561 Thannathrn Yuwasin. All rights reserved.
//

import UIKit
import Alamofire
import Kingfisher


class EventsTableViewController: UITableViewController {
    //http://www.mocky.io/v2/5a68d5b02e0000ea2bd5b5c8
    
    var eventsdata :[EventData] = []
    
    @IBOutlet weak var eventTableView : UITableView!
//    let eventName : [String] = ["กายภาพบำบัด","ตรวจเลือด","กินข้าวนอกบ้าน","ตรวจสุขภาพประจำปี"]
//    let eventDate : [Int] = [22,25,1,10]
//    let eventDetail : [String] = ["รับปริญญาที่ มช","รพ.สวนดอก","รพ.ราม","ไม่ได้กำหนด"]
//    let eventmonth : [String] = ["มกราคม","มกราคม","กุมภาพันธ์","มีนาคม"]
//    let eventPic : [String] = ["1.jpg","2.jpg","3.jpg","4.jpg"]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        eventTableView.delegate = self
        eventTableView.dataSource = self
        
        Alamofire.request("http://www.mocky.io/v2/5a68d5b02e0000ea2bd5b5c8").responseJSON { response in
            print("Request: \(String(describing: response.request))")   // original url request
            print("Response: \(String(describing: response.response))") // http url response
            print("Result: \(response.result)")                         // response serialization result
            
            if let json = response.result.value {
                print("JSON: \(json)") // serialized json response
                
                let dict:NSDictionary = json as! NSDictionary
                
                let eventsArray = dict.object(forKey: "events") as! NSArray
                
                for eventsJson in eventsArray {
                    let eventsDict = eventsJson as! NSDictionary
                    let event:EventData = EventData(json: eventsDict)
                    self.eventsdata.append(event)
                }
                self.eventTableView.reloadData()
                
            }
        }
        
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
        return eventsdata.count
    }


    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "EventCell", for: indexPath) as? EventsTableViewCell
//        let dictShow = eventArr[indexPath.row]
        let event = eventsdata[indexPath.row]
        if let eventname = event.eventName {
            cell?.eventNameLabel.text = eventname
        }else{
            cell?.eventNameLabel.text = "-"
        }
        if let eventImageView = event.eventPic {
            cell?.eventImageView.kf.setImage(with: URL(string:eventImageView))
        }else{
            cell?.eventImageView.image = UIImage(named: "1.jpg")
        }
        if let eventdate = event.eventDate {
            cell?.eventDateLabel.text = "\(eventdate)"
        }
        //cell?.eventDateLabel.text = event."\(eventDate[indexPath.row])"
        if let eventdetail = event.eventDetail {
            cell?.eventDetailLabel.text = eventdetail
        }
        if let eventmonth = event.eventMonth {
            cell?.eventMonthLabel.text = eventmonth
        }


//        if indexPath.row % 2 == 0 {
//            cell?.eventImageView.image = UIImage("")
//        }

        // Configure the cell...

        return cell!
    }
//    func eventTableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath){
//        eventTableView.deselectRow(at: indexPath, animated: true)
//        performSegue(withIdentifier: "gotoSubView", sender: indexPath)
//
//    }
//    
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        if (segue.identifier == "gotoSubView") {
//            let detailEventViewController = segue.destination as! DetailEventViewController
//            var indexPath:IndexPath = sender as! IndexPath
//            detailEventViewController.event = eventsdata[indexPath.row]
//            
//        }
//    }


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
