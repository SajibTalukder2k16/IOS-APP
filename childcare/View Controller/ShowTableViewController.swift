//
//  ShowTableViewController.swift
//  childcare
//
//  Created by Sajib Talukder on 6/12/19.
//  Copyright © 2019 Sajib Talukder. All rights reserved.
//

import UIKit
import FirebaseFirestore
import FirebaseCore

class ShowTableViewController: UIViewController {

    @IBOutlet weak var AvailButton3: UIButton!
    @IBOutlet weak var AvailButton2: UIButton!
    @IBOutlet weak var AvailButton1: UIButton!
    var db:Firestore!
    override func viewDidLoad() {
        AvailButton1.backgroundColor = UIColor.green
        AvailButton2.backgroundColor = UIColor.green
        AvailButton3.backgroundColor = UIColor.green
        super.viewDidLoad()
        let settings = FirestoreSettings()
        Firestore.firestore().settings = settings
        db = Firestore.firestore()
        
    }
    
    private func getMultiple()->Void {
        var list = [[String:Any]]()
        print(type (of: list))
        db.collection("users").whereField("usertype", isEqualTo: "BabySitter")
            .getDocuments() { (querySnapshot, err) in
                if let err = err {
                    print("Error getting documents: \(err)")
                } else {
                    for document in querySnapshot!.documents {
                        let temp = document.data()
                        list.append(temp)
                        print("\(document.documentID) => \(document.data())")
                    }
                }
        }
    }
    
    @IBAction func Avail1Action(_ sender: Any) {
        if (AvailButton1.backgroundColor == UIColor.green)
        {
            AvailButton1.backgroundColor = UIColor.red
            AvailButton1.setTitle("Not Available", for: .normal)
        }
        else
        {
            AvailButton1.backgroundColor = UIColor.green
            AvailButton1.setTitle("Available", for: .normal)
        }
    }
    
    @IBAction func Avail2Action(_ sender: Any) {
        if (AvailButton2.backgroundColor == UIColor.green)
        {
            AvailButton2.backgroundColor = UIColor.red
            AvailButton2.setTitle("Not Available", for: .normal)
        }
        else
        {
            AvailButton2.backgroundColor = UIColor.green
            AvailButton2.setTitle("Available", for: .normal)
        }
    }
    
    @IBAction func Avail3Action(_ sender: Any) {
        if (AvailButton3.backgroundColor == UIColor.green)
        {
            AvailButton3.backgroundColor = UIColor.red
            AvailButton3.setTitle("Not Available", for: .normal)
        }
        else
        {
            AvailButton3.backgroundColor = UIColor.green
            AvailButton3.setTitle("Available", for: .normal)
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
