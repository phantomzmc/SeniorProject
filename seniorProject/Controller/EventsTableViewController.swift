//
//  EventsTableViewController.swift
//  seniorProject
//
//  Created by Thannathrn Yuwasin on 7/1/2561 BE.
//  Copyright © 2561 Thannathrn Yuwasin. All rights reserved.
//

import UIKit
import FirebaseDatabase
import FirebaseAuth
import Alamofire
import Kingfisher


class EventsTableViewController: UITableViewController {
    
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
        
        loadFirebase()
        
//        Alamofire.request("http://www.mocky.io/v2/5a68d5b02e0000ea2bd5b5c8").responseJSON { response in
//            print("Request: \(String(describing: response.request))")   // original url request
//            print("Response: \(String(describing: response.response))") // http url response
//            print("Result: \(response.result)")                         // response serialization result
//
//            if let json = response.result.value {
//                print("JSON: \(json)") // serialized json response
//
//                let dict:NSDictionary = json as! NSDictionary
//
//                let eventsArray = dict.object(forKey: "events") as! NSArray
//
//                for eventsJson in eventsArray {
//                    let eventsDict = eventsJson as! NSDictionary
//                    let event:EventData = EventData(json: eventsDict)
//                    self.eventsdata.append(event)
//                }
//                self.eventTableView.reloadData()
//
//            }
//        }
    }
    
        func loadFirebase (){
            let displayname = Auth.auth().currentUser?.displayName
            print(displayname)
            Database.database().reference().child("Member").child(displayname!).child("Event").observe(.childAdded) { (snapshot : DataSnapshot) in
                if let dict = snapshot.value as? [String:Any]{
                    let eventName = dict["nameEvent"] as! String
                    let eventDetail = dict["detailEvent"] as! String
                    let eventDate = dict["dateEvent"] as! String
                    let eventMonth = dict["monthEvent"] as! String
                    let eventTime = dict["timerEvent"] as! String
                    
                    
                    let eventData = EventData (eventName: eventName, eventDetail: eventDetail, eventDate: eventDate, eventMonth: eventMonth ,eventTime : eventTime)
                    self.eventsdata.append(eventData)
                    print(snapshot.value)
                    print(self.eventsdata)
                    self.eventTableView.reloadData()
                }
                //                print(snapshot.value)
                
            }
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
        return eventsdata.count
    }


    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "EventCell", for: indexPath) as? EventsTableViewCell
        cell?.eventNameLabel.text = eventsdata[indexPath.row].eventName
        cell?.eventDateLabel.text = eventsdata[indexPath.row].eventDate
        cell?.eventDetailLabel.text = eventsdata[indexPath.row].eventDetail
        cell?.eventMonthLabel.text = eventsdata[indexPath.row].eventMonth
        cell?.eventTimeLabel.text = eventsdata[indexPath.row].eventTime
        return cell!
    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let alert = UIAlertController(title: eventsdata[indexPath.row].eventName,
                                      message: "ที่ : " + eventsdata[indexPath.row].eventDetail! + "\nวันที่ : " + eventsdata[indexPath.row].eventDate! + " เดือน : " + eventsdata[indexPath.row].eventMonth! + "\nเวลา : " + eventsdata[indexPath.row].eventTime!,
                                      preferredStyle: UIAlertControllerStyle.alert)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }


}
