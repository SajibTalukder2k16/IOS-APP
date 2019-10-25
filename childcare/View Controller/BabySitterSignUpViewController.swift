//
//  BabySitterSignUpViewController.swift
//  childcare
//
//  Created by Sajib Talukder on 23/10/19.
//  Copyright © 2019 Sajib Talukder. All rights reserved.
//

import UIKit
import FirebaseAuth
import Firebase


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
    
    func showError(_ message:String)
    {
        ErrorLabel.text=message
        ErrorLabel.alpha=1
    }
    func transitionToHome()
    {
        //storyboard?.instantiateViewController(withIdentifier: HomeVC)
        //storyboard?.instantiateInitialViewController(HomeVC)
    }
    //Validate Fields
    func  validateFields()->String?
    {
        if FullNameTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines)=="" || EmailTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines)==""||MobileTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines)==""||AgeTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines)==""||EduTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines)=="" || PasswordTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines)==""||ConfirmPasswordTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines)==""
        {
            return "Please fill in all fields"
        }
        let checkpassword = PasswordTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        if Utilities.isPasswordValid(checkpassword)==false{
            return "Please Ensure your password is at least 8 characters , contains one special character and a number"
        }
       /* if Utilities.isPasswordValid ( checkpassword )==false
        {
            return "Please Ensure your password is at least 8 characters , contains one special character and a number"
        }*/
        return nil
    }
    
    @IBAction func SubmitAction(_ sender: Any) {
        let error = validateFields()
        if error != nil{
            showError(error!)
        }
        else
        {
            //create data
            let name=FullNameTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            let email = EmailTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            let mobile = MobileTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            let age = AgeTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            let edu = EduTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            let gender=gd
            let password=PasswordTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            
            Auth.auth().createUser(withEmail: email, password: password) { (result, err) in
                if err != nil {
                    self.showError("Error in creating user")
                }
                else
                {
                    let db = Firestore.firestore()
                    
                    //db.collection("users").addDocument(data: ["name":name,"email":email,"mobile":mobile,"age":age,"education":edu,"gender":gender,"password":password,"uid":result!.user.uid],
                    
                    db.collection("users").addDocument(data:  ["name":name,"email":email,"mobile":mobile,"age":age,"education":edu,"gender":gender,"password":password,"uid":result!.user.uid], completion: { (error) in
                        
                        if error != nil{
                            self.showError("Error saving User data.")
                        }
                    })
                    
                    
                    //Transition to home
                    self.transitionToHome()
                    
                    
                        
                }
            }
        }
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
        GenderButton.forEach{
            (button) in
            UIView.animate(withDuration: 0.3, animations: {
               if(!button.isHidden)
               {
                button.isHidden=true
               }
                self.view.layoutIfNeeded()
            })
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
