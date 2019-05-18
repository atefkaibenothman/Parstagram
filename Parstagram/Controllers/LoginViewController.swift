//
//  LoginViewController.swift
//  Parstagram
//
//  Created by Atef Kai Benothman on 5/17/19.
//  Copyright © 2019 Atef Kai Benothman. All rights reserved.
//

import UIKit
import Parse

extension UIViewController
{
    func hideKeyboard()
    {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        
        view.addGestureRecognizer(tap)
    }
    
    @objc func dismissKeyboard()
    {
        view.endEditing(true)
    }
}

class LoginViewController: UIViewController
{
    
    // Outlets
    @IBOutlet weak var usernameField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var signupButton: UIButton!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        makeRoundedCorners(obj: loginButton)
        makeRoundedCorners(obj: signupButton)
        self.hideKeyboard()
    }
    
    @IBAction func onLogin(_ sender: Any)
    {
        let username = usernameField.text!
        let password = passwordField.text!
        
        PFUser.logInWithUsername(inBackground: username, password: password) { (user, error) in
            if user != nil
            {
                self.performSegue(withIdentifier: "loginSegue", sender: nil)
            }
        }
    }
    
    @IBAction func onSignup(_ sender: Any)
    {
        let user = PFUser()
        user.username = usernameField.text
        user.password = passwordField.text
        
        user.signUpInBackground { (success, error) in
            if success
            {
                self.performSegue(withIdentifier: "loginSegue", sender: nil)
            }
        }
    }
    
    func makeRoundedCorners(obj: UIButton)
    {
        obj.layer.cornerRadius = 10.0
        obj.layer.masksToBounds = true
    }
    
}
