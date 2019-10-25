//
//  BabySitterSignUpViewController.swift
//  childcare
//
//  Created by Sajib Talukder on 23/10/19.
//  Copyright © 2019 Sajib Talukder. All rights reserved.
//

import UIKit

class BabySitterSignUpViewController: UIViewController {

    
    //Gender Selection Button
    
    @IBOutlet var GenderButton: [UIButton]!
    
    //@IBOutlet var GenderButtons: [UIButton]!
    //
    @IBOutlet weak var FullNameTextField: UITextField!
   
    @IBOutlet weak var MobileTextField: UITextField!
    
    @IBOutlet weak var EmailTextField: UITextField!
    
    @IBOutlet weak var AgeTextField: UITextField!
    
    @IBOutlet weak var EduTextField: UITextField!

    @IBOutlet weak var PasswordTextField: UITextField!
    
    @IBOutlet weak var ConfirmPasswordTextField: UITextField!
    
    @IBOutlet weak var SubmitButton: UIButton!
    
    @IBOutlet weak var ErrorLabel: UILabel!
    
    var gd="Male"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpElements()

        // Do any additional setup after loading the view.
    }
    
    func setUpElements()
    {
        ErrorLabel.alpha=0
        Utilities.styleTextField(FullNameTextField)
        Utilities.styleTextField(MobileTextField)
        Utilities.styleTextField(EmailTextField)
        Utilities.styleTextField(AgeTextField)
        Utilities.styleTextField(EduTextField)
        Utilities.styleTextField(PasswordTextField)
        Utilities.styleTextField(ConfirmPasswordTextField)
        Utilities.styleFilledButton(SubmitButton)
        
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
    @IBAction func SubmitAction(_ sender: Any) {
    }
    
    
    //Gender Selection Action
    
    @IBAction func GenderSelectionAction(_ sender: UIButton) {
        GenderButton.forEach{
            (button) in
            UIView.animate(withDuration: 0.3, animations: {
                button.isHidden = !button.isHidden
                self.view.layoutIfNeeded()
            })
        }
    }
    
    enum Genders: String{
        case Male = "Male"
        case Female = "Female"
        case Others = "Others"
    }
    @IBAction func GenderTapped(_ sender: UIButton) {
        guard let title=sender.currentTitle , let gender = Genders(rawValue:title) else {
            return
        }
        
        switch gender{
        case.Others:
            gd="Others"
        case.Female:
            gd="Female"
        default:
            gd="Male"
        }
    }
    
    /*
    @IBAction func GenderSelection(_ sender: UIButton) {
        GenderButtons.forEach{
            (button) in
            UIView.animate(withDuration: 0.3, animations: {
                button.isHidden = !button.isHidden
                self.view.layoutIfNeeded()
            })
        }
    }
    
    @IBAction func GenderTapped(_ sender: UIButton) {
         guard let title=sender.currentTitle , let gender = Genders(rawValue:title) else {
                return
        }
        
        switch gender{
        case.Others:
            gd="Others"
        case.Female:
            gd="Female"
        default:
            gd="Male"
        }
    }
    //
 */
    
}
