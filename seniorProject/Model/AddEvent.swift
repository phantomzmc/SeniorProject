//
//  AddEvent.swift
//  seniorProject
//
//  Created by iThunnathorn  on 1/31/2561 BE.
//  Copyright © 2561 Thannathrn Yuwasin. All rights reserved.
//

import Foundation
import Firebase

class AddEvent : NSObject {
    var nameEvent : String!
    var detailEvent : String!
    var dateEvent : String!
    var monthEvent : String!
    var timerEvent : String!
//    var picEvent : String!
    let ref : DatabaseReference!
    
    init(nameEvent : String ,detailEvent : String ,dateEvent: String ,monthEvent : String, timerEvent : String ) {
        self.nameEvent = nameEvent
        self.detailEvent = detailEvent
        self.dateEvent = dateEvent
        self.monthEvent = monthEvent
        self.timerEvent = timerEvent
//        self.picEvent = picEvent
        self.ref = nil
        
    }
    init(snapshot : DataSnapshot) {
        //        key = snapshot.key
        let snapshotValue = snapshot.value as! [String:AnyObject]
        nameEvent = snapshotValue["nameEvent"] as! String
        detailEvent = snapshotValue["detailEvent"] as! String
        dateEvent = snapshotValue["dateEvent"] as! String
        monthEvent = snapshotValue["monthEvent"] as! String
        timerEvent = snapshotValue["timerEvent"] as! String
//        picEvent = snapshotValue["picEvent"] as! String

        ref = snapshot.ref
    }
    func toAnyObject() -> Any {
        return [
            "nameEvent" : nameEvent,
            "detailEvent" : detailEvent,
            "dateEvent" : dateEvent,
            "monthEvent" : monthEvent,
            "timerEvent" : timerEvent,
//            "picEvent" : picEvent,

        ]
    }
}
