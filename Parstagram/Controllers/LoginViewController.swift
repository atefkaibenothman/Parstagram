//
//  LoginViewController.swift
//  Parstagram
//
//  Created by Atef Kai Benothman on 5/17/19.
//  Copyright © 2019 Atef Kai Benothman. All rights reserved.
//

import UIKit

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
    }
    
    @IBAction func onSignup(_ sender: Any)
    {
    }
    
    func makeRoundedCorners(obj: UIButton)
    {
        obj.layer.cornerRadius = 10.0
        obj.layer.masksToBounds = true
    }
    
}
