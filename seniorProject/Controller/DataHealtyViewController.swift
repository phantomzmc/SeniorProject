//
//  DataHealtyViewController.swift
//  seniorProject
//
//  Created by iThunnathorn  on 1/20/2561 BE.
//  Copyright © 2561 Thannathrn Yuwasin. All rights reserved.
//

import UIKit

class DataHealtyViewController: UIViewController {
    @IBOutlet weak var viewHeigh : UIView?
    @IBOutlet weak var viewWeigth : UIView?
    @IBOutlet weak var viewCA : UIView?
    @IBOutlet weak var viewPill : UIView?

    override func viewDidLoad() {
        super.viewDidLoad()
        viewCA?.layer.cornerRadius = 75
        viewPill?.layer.cornerRadius = 75
        viewHeigh?.layer.cornerRadius = 75
        viewWeigth?.layer.cornerRadius = 75
        

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
