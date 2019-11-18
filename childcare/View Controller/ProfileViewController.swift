//
//  ProfileViewController.swift
//  childcare
//
//  Created by Sajib Talukder on 17/11/19.
//  Copyright © 2019 Sajib Talukder. All rights reserved.
//

import UIKit
import QuartzCore
import Firebase
class ProfileViewController: UIViewController {
    
    
    @IBOutlet weak var ProfileNameLevel: UILabel!
    @IBOutlet weak var EmailLabel: UILabel!
    @IBOutlet weak var MobileLabel: UILabel!
    @IBOutlet weak var AgeLabel: UILabel!
    @IBOutlet weak var BabyNameLabel: UILabel!
    @IBOutlet weak var BabyAgeLabel: UILabel!
    
    var userdocid = String()

    override func viewDidLoad() {
        super.viewDidLoad()
        setUpElements()
        //EmailLabel.layer.masksToBounds = true
        //EmailLabel.text = userdocid
        //print("Sajib Talukder")
        //print(userdocid)
        let db = Firestore.firestore()
        let docRef = db.collection("users").document(userdocid)
        
        docRef.getDocument { (document, error) in
            if let document = document, document.exists {
                //let dataDescription = document.data().map(String.init(describing:)) ?? "nil"
                let name = document.data()?["name"] as! String
                self.ProfileNameLevel.text = name //+ "'s Profile"
                self.EmailLabel.text = "Email: " + self.userdocid
                let mobile = document.data()?["mobile"] as! String
                self.MobileLabel.text = "Mobile: " + mobile
                let age = document.data()?["age"] as! String
                self.AgeLabel.text = "Age: " + age
                let babyname = document.data()?["BabyName"] as! String
                self.BabyNameLabel.text = "Child's Name: " + babyname
                let babyage = document.data()?["BabyAge"] as! String
                self.BabyAgeLabel.text = "Child's Age: " + babyage
               // print(name)

                /*name: String = {
                    print("Hello")
                    print(name)
                }*/
                //print("Document data: \(dataDescription)")
            }
        }

        // Do any additional setup after loading the view.
    }
    func setUpElements()
    {
        Utilities.styleLevel(EmailLabel)
        Utilities.styleLevel(ProfileNameLevel)
        Utilities.styleLevel(MobileLabel)
        Utilities.styleLevel(AgeLabel)
        Utilities.styleLevel(BabyAgeLabel)
        Utilities.styleLevel(BabyNameLabel)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if(segue.identifier == "protohome")
        {
            let homecontroller = segue.destination as! HomeViewController// ProfileViewController
            homecontroller.userdocid = userdocid
            //profilecontroller.userdocid = userdocid
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
