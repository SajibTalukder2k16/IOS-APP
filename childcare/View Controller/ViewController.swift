//
//  ViewController.swift
//  childcare
//
//  Created by Sajib Talukder on 22/10/19.
//  Copyright © 2019 Sajib Talukder. All rights reserved.
//

import UIKit
import Firebase

class ViewController: UIViewController {

    
    @IBOutlet weak var GuardianButton: UIButton!
    
    @IBOutlet weak var BabySitter: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        //let db=Firestore.firestore()
       // let newDocument=db.collection("test").document()
       // newDocument.setData(["Name":"Rabaya Islam Dhusor","Roll":1607095,"id":newDocument.documentID])
        
        setUpElements()
        
        // Do any additional setup after loading the view.
    }
    
    func setUpElements()
    {
        Utilities.styleFilledButton(GuardianButton)
        Utilities.styleFilledButton(BabySitter)
    }


}

