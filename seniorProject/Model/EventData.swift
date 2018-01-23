//
//  EventData.swift
//  seniorProject
//
//  Created by iThunnathorn  on 1/24/2561 BE.
//  Copyright © 2561 Thannathrn Yuwasin. All rights reserved.
//

import Foundation
class EventData {
    let eventDate : String
    let eventName : String
    let eventDetail : String
    let eventMonth : String
    
    init(eventDate : String, eventName : String , eventDetail : String , eventMonth : String) {
        self.eventDate = eventDate
        self.eventName = eventName
        self.eventDetail = eventDetail
        self.eventMonth = eventMonth
    }
}
