//
//  RegisterData.swift
//  seniorProject
//
//  Created by iThunnathorn  on 1/30/2561 BE.
//  Copyright © 2561 Thannathrn Yuwasin. All rights reserved.
//

import Foundation
import Firebase

class RegisterData : NSObject{
//    var key : String = ""
    var email : String!
    var username : String!
    var age : String!
    var DA : String!
    var pill : String!
    var tel : String!
    var sosUser : String!
    var sosTel : String!
    let ref : DatabaseReference!
    
    init(email : String ,username : String ,age: String ,DA : String ,pill:String ,tel: String, sosUser:String, sosTel:String ) {
        self.email = email
        self.username = username
        self.age = age
        self.DA = DA
        self.pill = pill
        self.tel = tel
        self.sosUser = sosUser
        self.sosTel = sosTel
        self.ref = nil
        
    }
    init(snapshot : DataSnapshot) {
//        key = snapshot.key
        let snapshotValue = snapshot.value as! [String:AnyObject]
        email = snapshotValue["email"] as! String
        username = snapshotValue["username"] as! String
        age = snapshotValue["age"] as! String
        DA = snapshotValue["DA"] as! String
        pill = snapshotValue["pill"] as! String
        tel = snapshotValue["tel"] as! String
        sosUser = snapshotValue["sosUser"] as! String
        sosTel = snapshotValue["sosTel"] as! String
        ref = snapshot.ref
    }
    func toAnyObject() -> Any {
        return [
            "email" : email,
            "username" : username,
            "age" : age,
            "DA" : DA,
            "pill" : pill,
            "tel" : tel,
            "sosUser" : sosUser,
            "sosTel" : sosTel
        ]
    }
    
    
}
