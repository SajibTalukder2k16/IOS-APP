//
//  FindNowViewController.swift
//  childcare
//
//  Created by Sajib Talukder on 4/12/19.
//  Copyright © 2019 Sajib Talukder. All rights reserved.
//

import UIKit
import FirebaseCore
import FirebaseFirestore

class FindNowViewController: UIViewController {
    
    @IBOutlet weak var table: UITableView!
    var db:Firestore!
    override func viewDidLoad() {
        super.viewDidLoad()
        let settings = FirestoreSettings()
        Firestore.firestore().settings = settings
        db = Firestore.firestore()
        getMultiple()
        
    }
    
    private func getMultiple() {
        // [START get_multiple]
        db.collection("users").whereField("usertype", isEqualTo: "BabySitter")
            .getDocuments() { (querySnapshot, err) in
                if let err = err {
                    print("Error getting documents: \(err)")
                } else {
                    for document in querySnapshot!.documents {
                        print("\(document.documentID) => \(document.data())")
                    }
                }
        }
        // [END get_multiple]
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
