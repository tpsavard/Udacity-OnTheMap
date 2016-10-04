//
//  LoginViewController.swift
//  OnTheMap
//
//  Created by Timothy Savard on 9/22/16.
//  Copyright © 2016 Timothy Savard. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak var usernameField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    @IBOutlet weak var loginButton: UIButton!
    
    
    // MARK:- View Controller Methods
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // Fix up the UI
        enableLogin()
    }
    
    
    // MARK:- UI Methods
    
    @IBAction func login(sender: UIButton) {
        print("login IBAction called")
    }
    
    @IBAction func textFieldUpdated(_ sender: AnyObject) {
        print("textFieldUpdated called")
        
        enableLogin()
    }
    
    
    // MARK:- Other Methods
    
    func enableLogin() {
        loginButton.isEnabled = !(usernameField.text!.isEmpty || passwordField.text!.isEmpty)
    }

}

