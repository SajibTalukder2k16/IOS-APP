//
//  HomeViewController.swift
//  childcare
//
//  Created by Sajib Talukder on 23/10/19.
//  Copyright © 2019 Sajib Talukder. All rights reserved.
//

import UIKit
import QuartzCore

class HomeViewController: UIViewController {

    
    @IBOutlet weak var BackButton: UIButton!
    @IBOutlet weak var AboutUsButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        BackButton.layer.cornerRadius = 15
        AboutUsButton.layer.cornerRadius = 30
        AboutUsButton.layer.cornerRadius =  AboutUsButton.frame.size.width / 2
        AboutUsButton.clipsToBounds = true
        AboutUsButton.layer.borderColor = UIColor.black.cgColor
        AboutUsButton.layer.borderWidth = 4
        //AboutUsButton.layer.shadowColor = UIColor.green.cgColor
        //AboutUsButton.layer.shadowOffset = CGSize(width: 5, height: 5)
        //AboutUsButton.layer.shadowRadius = 0.0
        //AboutUsButton.layer.shadowOpacity = 1
       // AboutUsButton.layer.masksToBounds = false

        // Do any additional setup after loading the view.
    }
    

    @IBAction func AboutUsAction(_ sender: UIButton) {
        
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
