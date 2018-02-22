//
//  HealthData.swift
//  seniorProject
//
//  Created by iThunnathorn  on 1/25/2561 BE.
//  Copyright © 2561 Thannathrn Yuwasin. All rights reserved.
//

import Foundation
class HealthData : NSObject {
    var healthName : String!
    var healthDetail : String!
    var healthPic : String!
    
    
    init(healthName : String, healthDetail : String, healthPic : String) {
        self.healthName = healthName
        self.healthDetail = healthDetail
        self.healthPic = healthPic
    }
    init (json:NSDictionary?){
        self.healthName = json?.object(forKey:"title") as! String
        self.healthDetail = json?.object(forKey:"link") as! String
        self.healthPic = json?.object(forKey:"thumbnail") as! String

    }
    
    override init() {
        self.healthName = ""
        self.healthDetail = ""
        self.healthPic = ""
    }
}
