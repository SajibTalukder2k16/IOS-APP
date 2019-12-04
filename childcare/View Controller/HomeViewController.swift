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
    
    @IBOutlet weak var ProfileButton: UIButton!
    
    @IBOutlet weak var FindNowButton: UIButton!
    
    @IBOutlet weak var HistoryButton: UIButton!
    
    @IBOutlet weak var TopRatedButton: UIButton!
    
    var userdocid = String()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //print("Sajib Talukder")
        //print(userdocid)
        BackButton.layer.cornerRadius = 15
        AboutUsButton.layer.cornerRadius = 30
        AboutUsButton.layer.cornerRadius =  AboutUsButton.frame.size.width / 2
        AboutUsButton.clipsToBounds = true
        AboutUsButton.layer.borderColor = UIColor.black.cgColor
        AboutUsButton.layer.borderWidth = 4
        
        ProfileButton.layer.cornerRadius = 30
        ProfileButton.layer.cornerRadius =  ProfileButton.frame.size.width / 2
        ProfileButton.clipsToBounds = true
        ProfileButton.layer.borderColor = UIColor.black.cgColor
        ProfileButton.layer.borderWidth = 4
        
        FindNowButton.layer.cornerRadius = 30
        FindNowButton.layer.cornerRadius =  FindNowButton.frame.size.width / 2
        FindNowButton.clipsToBounds = true
        FindNowButton.layer.borderColor = UIColor.black.cgColor
        FindNowButton.layer.borderWidth = 4
        
        HistoryButton.layer.cornerRadius = 30
        HistoryButton.layer.cornerRadius =  HistoryButton.frame.size.width / 2
        HistoryButton.clipsToBounds = true
        HistoryButton.layer.borderColor = UIColor.black.cgColor
        HistoryButton.layer.borderWidth = 4
        
        TopRatedButton.layer.cornerRadius = 30
        TopRatedButton.layer.cornerRadius =  TopRatedButton.frame.size.width / 2
        TopRatedButton.clipsToBounds = true
        TopRatedButton.layer.borderColor = UIColor.black.cgColor
        TopRatedButton.layer.borderWidth = 4
        
        
        //AboutUsButton.layer.shadowColor = UIColor.green.cgColor
        //AboutUsButton.layer.shadowOffset = CGSize(width: 5, height: 5)
        //AboutUsButton.layer.shadowRadius = 0.0
        //AboutUsButton.layer.shadowOpacity = 1
       // AboutUsButton.layer.masksToBounds = false

        // Do any additional setup after loading the view.
    }
    
    @IBAction func DevTapped(_ sender: Any) {
        
        //let htd = segue.destination as! AboutUsViewController
        //htd.userdocid = userdocid
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if(segue.identifier == "seguepro")
        {
        let profilecontroller = segue.destination as! ProfileViewController
        profilecontroller.userdocid = userdocid
        }
        else if(segue.identifier == "hometodev")
        {
            let htd = segue.destination as! AboutUsViewController
            htd.userdocid = userdocid
        }
        else if(segue.identifier == "hometomap")
        {
            let htm = segue.destination as! MapViewController
            htm.userdocid = userdocid
            
        }
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
