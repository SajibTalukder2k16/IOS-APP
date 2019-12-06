//
//  BabySitterLogInViewController.swift
//  childcare
//
//  Created by Sajib Talukder on 23/10/19.
//  Copyright © 2019 Sajib Talukder. All rights reserved.
//

import UIKit
import FirebaseAuth
import Firebase

class BabySitterLogInViewController: UIViewController {

    
    @IBOutlet weak var EmailTextField: UITextField!
    
    @IBOutlet weak var PasswordTextField: UITextField!
    
    @IBOutlet weak var LogInButton: UIButton!
    
    @IBOutlet weak var CreateAccountButton: UIButton!
    
    @IBOutlet weak var ErrorLabel: UILabel!
    var check = Bool()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        check = false
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
    
    
    /*
    @IBAction func LogInAction(_ sender: Any) {
        //let hvc = HomeViewController()
        //hvc.userdocid = EmailTextField.text!
        let email=EmailTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        let pass=PasswordTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        Auth.auth().signIn(withEmail: email, password: pass) { (result, error) in
            if error != nil {
                self.ErrorLabel.text = error!.localizedDescription
                self.ErrorLabel.alpha = 1
            }
            else
            {
                self.check = true
                
                //performSegue(withIdentifier: "segue", sender:"self")
                //let homeViewController = self.storyboard?.instantiateViewController(withIdentifier: Constants.Storyboard.homeViewController) as? HomeViewController
                //let homeViewController = storyboard?.instantiateViewController(withIdentifier: Constants.Storyboard.homeViewController ) as? HomeViewController
                //self.view.window?.rootViewController = homeViewController
                //self.view.window?.makeKeyAndVisible()
                //view.window?.rootViewController = homeViewController
                //view.window?.makeKeyAndVisible()
            }
        }
    }*/
    func checker()->Bool
    {
        let email=EmailTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        let pass=PasswordTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        Auth.auth().signIn(withEmail: email, password: pass) { (result, error) in
            if error != nil {
                self.ErrorLabel.text = error!.localizedDescription
                self.ErrorLabel.alpha = 1
                self.check = false
            }
            else
            {
                self.check = true;
                //self.check = true
                
                //performSegue(withIdentifier: "segue", sender:"self")
                //let homeViewController = self.storyboard?.instantiateViewController(withIdentifier: Constants.Storyboard.homeViewController) as? HomeViewController
                //let homeViewController = storyboard?.instantiateViewController(withIdentifier: Constants.Storyboard.homeViewController ) as? HomeViewController
                //self.view.window?.rootViewController = homeViewController
                //self.view.window?.makeKeyAndVisible()
                //view.window?.rootViewController = homeViewController
                //view.window?.makeKeyAndVisible()
            }
        }
        if(check == true)
        {
            return true;
        }
        else
        {
            return false
        }
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
       // print("Hello ")
       // print(segue)
       // print("Sajib  Ha ha")
        //print(segue.identifier!)
        if(segue.identifier == "seguecheck")
        {
            let homecontroller = segue.destination as! HomeViewController
            homecontroller.userdocid = EmailTextField.text!
            //print("Hello")
            //print(EmailTextField.text!)
            //print(homecontroller.userdocid)
        }
        /*
        let db = Firestore.firestore()
        let userdocid = EmailTextField.text!
        var usertype = String()
        let docRef = db.collection("users").document(userdocid)
        
        docRef.getDocument { (document, error) in
            if let document = document, document.exists {
                //let dataDescription = document.data().map(String.init(describing:)) ?? "nil"
                usertype = document.data()?["usertype"] as! String
            }
        }
        if(usertype=="Guardian")
        {
        if(segue.identifier == "seguecheck")
        {
            let homecontroller = segue.destination as! HomeViewController
            homecontroller.userdocid = EmailTextField.text!
            //print("Hello")
            //print(EmailTextField.text!)
            //print(homecontroller.userdocid)
        }
        }
        else
        {
            if(segue.identifier == "seguecheck")
            {
                //let homecontroller = segue.destination as! BabyHomeViewController// HomeViewController
               // homecontroller.userdocid = EmailTextField.text!
                let babyhomeViewController = self.storyboard?.instantiateViewController(withIdentifier: Constants.Storyboard.homeViewController) as? BabyHomeViewController
                view.window?.rootViewController = babyhomeViewController
                //view.window?.makeKeyAndVisible()
            }
        }*/
    }
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        //print(check)
        //print(identifier)
        if(identifier != "seguecheck")
        {
            return true;
        }
        if(identifier == "seguecheck")
        {
            //print(check)
            //performSegue(withIdentifier: "seguecheck", sender:"self")
            if(checker()==true)
            {
                return true
            }
            else
            {
                return false
            }
        }
        else
        {
            return false
        }
    }
    
}
