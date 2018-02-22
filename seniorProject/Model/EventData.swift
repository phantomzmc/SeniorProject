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
    
    init(eventName : String , eventDetail : String ,eventDate : String,  eventMonth : String) {
        self.eventName = eventName
        self.eventDetail = eventDetail
        self.eventDate = eventDate
        self.eventMonth = eventMonth
    }
    init (json:NSDictionary?) {
        self.eventName = json?.object(forKey: "name") as! String
        self.eventDetail = json?.object(forKey: "detail") as? String
        self.eventDate = json?.object(forKey: "date") as! String
        self.eventMonth = json?.object(forKey: "month") as! String
    }
    override init() {
        self.eventName = ""
        self.eventDate = ""
        self.eventMonth = ""
    }
}
