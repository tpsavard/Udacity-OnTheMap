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
    
    let networkRequests: NetworkRequests = NetworkRequests()
    
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
        print("textFieldUpdated called")
        enableLogin()
    }
    
    @IBAction func logIn(sender: UIButton) {
        print("LogIn IBAction called")
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
        
        // Make the call
        networkRequests.logIn(username: username, password: password) { (logInResult) in
            // Handle the login outcome
            let castResult = logInResult as! NetworkRequests.LogInResults
            switch castResult {
            case NetworkRequests.LogInResults.success:
                NSLog("Log in succeeded")
                self.performSegue(withIdentifier: "LoggedIn", sender: nil)
            case NetworkRequests.LogInResults.failedForCredentials:
                self.showLogInFailureAlert(message: NSLocalizedString("LoginCredentialFailure", comment: "Credentials failure text"))
            case NetworkRequests.LogInResults.failedForNetworkingError:
                NSLog("Log in failed for networking error")
                self.showLogInFailureAlert(message: NSLocalizedString("LoginNetworkFailure", comment: "Network failure text"))
            }
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

}

