//
//  SOSViewController.swift
//  seniorProject
//
//  Created by Thannathrn Yuwasin on 5/1/2561 BE.
//  Copyright © 2561 Thannathrn Yuwasin. All rights reserved.
//

import UIKit
//import FirebaseDatabase
import FirebaseAuth
import CoreLocation



class SOSViewController: UIViewController, CLLocationManagerDelegate{
    
//    let ref = Database.database().reference()
    let locationManager:CLLocationManager = CLLocationManager()
    

    @IBOutlet weak var SOSbuntton: UIButton!
    @IBOutlet weak var Telbutton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        SOSbuntton.layer.cornerRadius = 100
        Telbutton.layer.cornerRadius = 100
        


    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func SOSbutton (sender : Any) {
        if let phoneCallURL = URL(string: "tel://1669") {
            let application:UIApplication = UIApplication.shared
            if (application.canOpenURL(phoneCallURL)) {
                application.open(phoneCallURL, options: [:], completionHandler: nil)
            }
        }
        locationManager.delegate = self
        locationManager.requestAlwaysAuthorization()
        locationManager.startUpdatingLocation()
        locationManager.distanceFilter = 100
        let geoFenceRegion:CLCircularRegion = CLCircularRegion(center: CLLocationCoordinate2DMake(43.61871, -116.214607), radius: 100, identifier: "Boise")
        locationManager.startMonitoring(for: geoFenceRegion)
    }
    @IBAction func Telbutton (sender : Any) {
        
        let phoneNumber = 0903198808
        if let phoneCallURL = URL(string: "tel://\(phoneNumber)") {
            
            let application:UIApplication = UIApplication.shared
            if (application.canOpenURL(phoneCallURL)) {
                application.open(phoneCallURL, options: [:], completionHandler: nil)
            }
        }
        locationManager.delegate = self
        locationManager.requestAlwaysAuthorization()
        locationManager.startUpdatingLocation()
        locationManager.distanceFilter = 100
        let geoFenceRegion:CLCircularRegion = CLCircularRegion(center: CLLocationCoordinate2DMake(43.61871, -116.214607), radius: 100, identifier: "Boise")
        locationManager.startMonitoring(for: geoFenceRegion)
        
        
    }
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
        for currentLocation in locations{
            print("\(index): \(currentLocation)")
            
            // "0: [locations]"
        }
    }
    func locationManager(_ manager: CLLocationManager, didEnterRegion region: CLRegion) {
        print("Entered: \(region.identifier)")
    }
    
    func locationManager(_ manager: CLLocationManager, didExitRegion region: CLRegion) {
        print("Exited: \(region.identifier)")
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
