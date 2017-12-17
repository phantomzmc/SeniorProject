//
//  Const.swift
//  seniorProject
//
//  Created by Thannathrn Yuwasin on 18/12/2560 BE.
//  Copyright © 2560 Thannathrn Yuwasin. All rights reserved.
//

import Foundation
import UIKit

class Const {
    func ShowAlert (title:String ,messeage:String, viewController:UIViewController) {
        let alert = UIAlertController (title: title, message: messeage, preferredStyle: .alert)
        let resultAlert = UIAlertAction (title: "OK", style: .cancel, handler: nil)
        alert.addAction(resultAlert)
        viewController.present(alert, animated: true, completion: nil)
        
    }
}
