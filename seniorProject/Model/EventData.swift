//
//  EventData.swift
//  seniorProject
//
//  Created by iThunnathorn  on 1/24/2561 BE.
//  Copyright © 2561 Thannathrn Yuwasin. All rights reserved.
//

import Foundation
class EventData : NSObject {
    var eventName : String!
    var eventDetail : String?
    var eventDate : Int!
    var eventMonth : String!
    var eventPic : String?
    
    init(eventName : String , eventDetail : String ,eventDate : Int,  eventMonth : String, eventPic : String) {
        self.eventName = eventName
        self.eventDetail = eventDetail
        self.eventDate = eventDate
        self.eventMonth = eventMonth
        self.eventPic = eventPic
    }
    init (json:NSDictionary?) {
        self.eventName = json?.object(forKey: "name") as! String
        self.eventDetail = json?.object(forKey: "detail") as? String
        self.eventDate = json?.object(forKey: "date") as! Int
        self.eventMonth = json?.object(forKey: "month") as! String
        self.eventPic = json?.object(forKey: "pic") as? String
    }
    override init() {
        self.eventName = ""
        self.eventDate = 0
        self.eventMonth = ""
    }
}
