//
//  ProfileViewController.swift
//  childcare
//
//  Created by Sajib Talukder on 17/11/19.
//  Copyright © 2019 Sajib Talukder. All rights reserved.
//

import UIKit
import QuartzCore

class ProfileViewController: UIViewController {
    
    
    @IBOutlet weak var EmailLabel: UILabel!
    var userdocid = String()

    override func viewDidLoad() {
        super.viewDidLoad()
        EmailLabel.layer.masksToBounds = true
        EmailLabel.text = userdocid
        print("Sajib Talukder")
        print(userdocid)

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
