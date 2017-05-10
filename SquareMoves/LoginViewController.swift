//
//  ViewController.swift
//  SquareMoves
//
//  Created by Lindsey pollock on 4/18/17.
//  Copyright © 2017 Lindsey pollock. All rights reserved.
//

import UIKit
import Firebase



class LoginViewController: UIViewController {
    
    
    var signUpActive: Bool?
    
    
//    
//    var ud = UserDefaults.standard
    
    @IBOutlet weak var emailTF: UITextFieldX!
    @IBOutlet weak var emailProgressView: UIProgressView!
    @IBOutlet weak var usernameTF: UITextFieldX!
    @IBOutlet weak var usernameProgressView: UIProgressView!
    @IBOutlet weak var passwordTF: UITextFieldX!
    @IBOutlet weak var passwordProgressView: UIProgressView!
    
    @IBOutlet weak var switchButton: UIButton!
    @IBOutlet weak var LoginSignupButton: UIButton!
    @IBOutlet weak var helpButton: UIButton!
    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()

        signUpActive = false
        
        helpButton.layer.borderWidth = 1
        
        helpButton.layer.cornerRadius = 22
        usernameTF.isHidden = true
        emailProgressView.isHidden = true
        usernameProgressView.isHidden = true
        passwordProgressView.isHidden = true
        self.hideKeyboardWhenTappedAround()
        
        
    }

    
    // TextField Functions
    
    @IBAction func emailTFAction(_ sender: UITextField) {
        emailProgressView.isHidden = false
        
    }
    
    @IBAction func emailTFChanged(_ sender: Any) {
    }
    
   
    @IBAction func usernameTFAction(_ sender: Any) {
        usernameProgressView.isHidden = false
    }
    
    @IBAction func usernameTFChanged(_ sender: Any) {
    }
    
    
    @IBAction func passwordTFAction(_ sender: Any) {
        passwordProgressView.isHidden = false
        
    }
    
    @IBAction func passwordTFChanged(_ sender: Any) {
        
        
    }
    
    
    
    
    
    
    
//    @IBAction func progressBar(_ sender: Any) {
//        if emailTF.isEditing {
//            
//            emailProgressView.isHidden = false
//            
//        } else if usernameTF.isEditing {
//            
//            usernameProgressView.isHidden = false
//            
//        } else if passwordTF.isEditing {
//            
//            passwordProgressView.isHidden = false
//        }
//        
//        
//    }
    
    

    
    @IBAction func handleSwitch(_ sender: Any) {
        
        if LoginSignupButton.currentTitle == "Sign Up"{
            usernameTF.isHidden = true
            LoginSignupButton.setTitle("Login", for: .normal)
            switchButton.setTitle("Switch to Sign Up", for: .normal)
            signUpActive = false
            
            
        } else {
            usernameTF.isHidden = false
            LoginSignupButton.setTitle("Sign Up", for: .normal)
            switchButton.setTitle("Switch to Login", for: .normal)
            signUpActive = true
        }
        
    }
    
    
    @IBAction func LoginSignupButton(_ sender: Any) {
        
        
        
        if signUpActive == true {
            
            
            
            guard let email = emailTF.text, let password = passwordTF.text, let username = usernameTF.text else {
                print("form is not valid")
                return
            }
            
            
            FIRAuth.auth()?.createUser(withEmail: email, password: password, completion: { (user: FIRUser?, Error) in
                if Error != nil {
                    print("error")
                }
                
//                self.performSegue(withIdentifier: "customerLoginSegue", sender: self)
                guard let uid = user?.uid else {
                    return
                }
                let ref = FIRDatabase.database().reference(fromURL: "https://squaremoves-6b0ee.firebaseio.com/")
                let usersReference = ref.child("users").child(uid)
                let values = ["username": username, "email": email, "password": password]
                usersReference.updateChildValues(values, withCompletionBlock: { (err, ref) in
                    if err != nil {
                        print("error")
                        return
                    }
                    
                    print("saved users succefully into firebase db")
                })
                
            })

            
            
        } else {
            
            
            guard let email = emailTF.text, let password = passwordTF.text else {
                print("form is not valid")
                return
            }

            FIRAuth.auth()?.signIn(withEmail: email, password: password, completion: { (FIRUser, Error) in
                if Error != nil {
                    print("error")
                }
                
                self.performSegue(withIdentifier: "customerLoginSegue", sender: self)
            })
            
            
        
            
        }
        
    }
    

    
    
//    override func viewWillAppear(_ animated: Bool) {
//        if FIRAuth.auth()?.currentUser != nil {
//        
//            self.performSegue(withIdentifier:  "barLoginSegue", sender: self)
//            
//        } else {
//            
//            print("error")
//            
//        }
//    }

    
}

extension UIViewController {
    func hideKeyboardWhenTappedAround() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(UIViewController.dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    
    func dismissKeyboard() {
        view.endEditing(true)
    }
}
