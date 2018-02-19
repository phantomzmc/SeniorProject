//
//  PillData.swift
//  seniorProject
//
//  Created by iThunnathorn  on 20/2/2561 BE.
//  Copyright © 2561 Thannathrn Yuwasin. All rights reserved.
//

import Foundation
import Firebase

class PillData: NSObject {
    var namePill : String!
    var eakPill : String!
    var timePill : String!
    
    let ref : DatabaseReference!
    
    init (namePill : String , eakPill : String ,timePill : String) {
        self.namePill = namePill
        self.eakPill = eakPill
        self.timePill = timePill
        self.ref = nil
    }
    init(snapshot : DataSnapshot) {
        let snapshotValue = snapshot.value as! [String:AnyObject]
        namePill = snapshotValue["namePill"] as! String
        eakPill = snapshotValue["eakPill"] as! String
        timePill = snapshotValue["timePill"] as! String
        ref = snapshot.ref
    }
    func toAnyObject () -> Any {
        return [
            "namePill" : namePill,
            "eakPill" : eakPill,
            "timePill" : timePill
        ]
    }
}
