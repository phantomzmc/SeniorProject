//
//  DataBMI.swift
//  seniorProject
//
//  Created by iThunnathorn  on 2/9/2561 BE.
//  Copyright © 2561 Thannathrn Yuwasin. All rights reserved.
//

import Foundation
import Firebase

class DataBMI : NSObject {
    var healthWeigth : String!
    var healthHigth : String!
    var healthPillSafe : String!
    var healthHospital : String!
    
    let ref : DatabaseReference!
    
    init (healthWeigth : String , healthHigth : String , healthPillSafe : String , healthHospital : String){
        self.healthWeigth = healthWeigth
        self.healthHigth = healthHigth
        self.healthPillSafe = healthPillSafe
        self.healthHospital = healthHospital
        self.ref = nil
    }
    init(snapshot : DataSnapshot){
        let snapshotValue = snapshot.value as! [String:AnyObject]
        healthWeigth = snapshotValue["weigth"] as! String
        healthHigth = snapshotValue["higth"] as! String
        healthPillSafe = snapshotValue["pillsafe"] as! String
        healthHospital = snapshotValue["hospital"] as! String
        ref = snapshot.ref
    }
    func toAnyObject() -> Any {
        return [
            "weigth" : healthWeigth,
            "higth" : healthHigth,
            "pillsafe" : healthPillSafe,
            "hospital" : healthHospital,
        ]
    }
}
