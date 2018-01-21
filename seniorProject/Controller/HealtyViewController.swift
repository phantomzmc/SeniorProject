//
//  HealtyViewController.swift
//  seniorProject
//
//  Created by iThunnathorn  on 1/20/2561 BE.
//  Copyright © 2561 Thannathrn Yuwasin. All rights reserved.
//

import UIKit

class HealtyViewController: UIViewController {
    
    var container : ContainerViewController!
    @IBOutlet weak var statusSegment : UISegmentedControl?

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func controlSegment(_ sender: Any) {
        if(statusSegment?.selectedSegmentIndex == 0)
        {
            container.segueIdentifierReceivedFromParent("first")
        }
        else if(statusSegment?.selectedSegmentIndex == 1)
        {
            container.segueIdentifierReceivedFromParent("second")
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "container"{
        self.container =  segue.destination as! ContainerViewController
        }

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
