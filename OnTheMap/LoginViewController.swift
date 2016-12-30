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
    
    // MARK:- View Controller Properties & Methods
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // Fix up the UI
        enableLogin()
    }
    
    // MARK:- UI Methods
    
    @IBAction func textFieldUpdated(sender: AnyObject) {
        enableLogin()
    }
    
    @IBAction func textFieldDone(sender: UITextField) {
        print("textFieldDone IBAction called")
        
        // Check which text field sent this: login (1) or password (2)
        switch sender.tag {
        case 1:
            passwordField.becomeFirstResponder()
        case 2:
            sender.resignFirstResponder()
            logIn()
        default:
            break
        }
    }
    
    @IBAction func logIn(sender: UIButton) {
        print("LogIn IBAction called")
        
        // Shorthand to cancel keyboard if either text field is actively being editted
        sender.becomeFirstResponder()
        
        logIn()
    }
    
    @IBAction func signUp(sender: UIButton) {
        print("SignUp IBAction called")
        signUp()
    }
    
    // MARK:- Other Methods
    
    func enableLogin() {
        loginButton.isEnabled = !(usernameField.text!.isEmpty || passwordField.text!.isEmpty)
    }
    
    func logIn() {
        let username: String = usernameField.text!
        let password: String = passwordField.text!
        
        // Setup the UI
        setNetworkActivityStatus(active: true)
        
        // Make the call
        Session.networkRequests.logIn(username: username, password: password) { (logInResult) in
            // Handle the login outcome
            switch logInResult {
            case NetworkRequests.Results.success:
                self.performSegue(withIdentifier: "LoggedIn", sender: nil)
                self.passwordField.text = ""
            case NetworkRequests.Results.failedForCredentials:
                self.showLogInFailureAlert(message: NSLocalizedString("LoginCredentialFailure", comment: "Credentials failure text"))
            case NetworkRequests.Results.failedForNetworkingError:
                self.showLogInFailureAlert(message: NSLocalizedString("NetworkFailure", comment: "Network failure text"))
            }
            
            // Clean up the UI
            self.setNetworkActivityStatus(active: false)
        }
    }
    
    func showLogInFailureAlert(message: String) {
        // Construct the alert ingredients
        let alertController: UIAlertController = UIAlertController(
            title: NSLocalizedString("LoginFailureTitle", comment: "Login failed alert title"),
            message: message,
            preferredStyle:UIAlertControllerStyle.alert)
        let alertAction: UIAlertAction = UIAlertAction(
            title: NSLocalizedString("OK", comment: "Not good-OK, not bad-OK, just OK-OK"),
            style: UIAlertActionStyle.default,
            handler: nil)
        
        // Showtime!
        alertController.addAction(alertAction)
        self.present(alertController, animated: true, completion: nil)
    }
    
    func signUp() {
        // Jump to Safari and open the sign up link
        if let signUpURL = URL(string: "https://www.udacity.com/account/auth#!/signup") {
            UIApplication.shared.open(signUpURL, options: [:], completionHandler: nil)
        }
    }
    
    func setNetworkActivityStatus(active: Bool) {
        UIApplication.shared.isNetworkActivityIndicatorVisible = active
        view.isUserInteractionEnabled = !active
    }

}

