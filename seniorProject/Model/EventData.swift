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
    var eventDate : String!
    var eventMonth : String!
    var eventTime : String!
    
    
    init(eventName : String , eventDetail : String ,eventDate : String,  eventMonth : String ,eventTime : String) {
        self.eventName = eventName
        self.eventDetail = eventDetail
        self.eventDate = eventDate
        self.eventMonth = eventMonth
        self.eventTime = eventTime
    }
    init (json:NSDictionary?) {
        self.eventName = json?.object(forKey: "name") as! String
        self.eventDetail = json?.object(forKey: "detail") as? String
        self.eventDate = json?.object(forKey: "date") as! String
        self.eventMonth = json?.object(forKey: "month") as! String
        self.eventTime = json?.object(forKey: "time") as! String
    }
    override init() {
        self.eventName = ""
        self.eventDetail = ""
        self.eventDate = ""
        self.eventMonth = ""
        self.eventTime = ""
    }
}
