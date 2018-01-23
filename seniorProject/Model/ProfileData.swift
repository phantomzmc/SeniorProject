//
//  ProfileData.swift
//  seniorProject
//
//  Created by iThunnathorn  on 1/22/2561 BE.
//  Copyright © 2561 Thannathrn Yuwasin. All rights reserved.
//

import Foundation

class ProfileData
{
    private var _nameText : String!
    private var _birthdayText : String!
    private var _daText : String!
    private var _pillText : String!
    private var _hospitalText : String!
    private var _telSOSText : String!
    
    var NameText : String {
        return _nameText
    }
    var BirthdayText : String {
        return _birthdayText
    }
    var DAText : String {
        return _daText
    }
    var PillText : String {
        return _pillText
    }
    var HospitalText : String {
        return _hospitalText
    }
    var TelSOSText : String {
        return _telSOSText
    }
    init(nameText:String, birthdayText:String, daText:String,pillText:String,hospitalText : String,telsosText : String ) {
        self._nameText = nameText
        self._birthdayText = birthdayText
        self._daText = daText
        self._pillText = pillText
        self._hospitalText = hospitalText
        self._telSOSText = telsosText
    }
}
