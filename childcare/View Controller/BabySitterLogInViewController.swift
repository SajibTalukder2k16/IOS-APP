//
//  BabySitterLogInViewController.swift
//  childcare
//
//  Created by Sajib Talukder on 23/10/19.
//  Copyright © 2019 Sajib Talukder. All rights reserved.
//

import UIKit

class BabySitterLogInViewController: UIViewController {

    
    @IBOutlet weak var EmailTextField: UITextField!
    
    @IBOutlet weak var PasswordTextField: UITextField!
    
    @IBOutlet weak var LogInButton: UIButton!
    
    @IBOutlet weak var CreateAccountButton: UIButton!
    
    @IBOutlet weak var ErrorLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpElements()
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
    func setUpElements()
    {
        ErrorLabel.alpha=0
        //Utilities.styleTextField(FullNameTextField)
       // Utilities.styleTextField(MobileTextField)
        Utilities.styleTextField(EmailTextField)
       // Utilities.styleTextField(AgeTextField)
       // Utilities.styleTextField(EduTextField)
        Utilities.styleTextField(PasswordTextField)
        Utilities.styleFilledButton(LogInButton)
        Utilities.styleFilledButton(CreateAccountButton)
       // Utilities.styleTextField(ConfirmPasswordTextField)
       // Utilities.styleFilledButton(SubmitButton)
        
    }
    
    @IBAction func LogInAction(_ sender: Any) {
    }
    
}
