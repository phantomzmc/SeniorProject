//
//  SOSViewController.swift
//  seniorProject
//
//  Created by Thannathrn Yuwasin on 5/1/2561 BE.
//  Copyright © 2561 Thannathrn Yuwasin. All rights reserved.
//

import UIKit


class SOSViewController: UIViewController {

    @IBOutlet weak var SOSbuntton: UIButton!
    @IBOutlet weak var Telbutton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        SOSbuntton.layer.cornerRadius = 100
        
        Telbutton.layer.cornerRadius = 100
        

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
