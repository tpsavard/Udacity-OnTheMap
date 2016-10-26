//
//  HubViewController.swift
//  OnTheMap
//
//  Created by Savard, Tim on 10/13/16.
//  Copyright © 2016 Timothy Savard. All rights reserved.
//

import UIKit

class HubViewController: UITabBarController {

    let networkRequests: NetworkRequests = Session.networkRequests
    

    // MARK:- UI Methods
    
    @IBAction func logOut(sender: UIBarButtonItem) {
        print("logOut IBAction called")
        logOut()
    }
    
    @IBAction func refresh(sender: UIBarButtonItem) {
        print("refresh IBAction called")
        refresh()
    }
    
    
    // MARK:- Other Methods
    
    func logOut() {
        // Setup the UI
        setNetworkActivityStatus(active: true)
        
        // Make the call
        networkRequests.logOut() { (logOutResult) in
            // Handle the login outcome
            switch logOutResult {
            case NetworkRequests.Results.success:
                NSLog("Log out succeeded")
                self.dismiss(animated: true, completion: nil)
            case NetworkRequests.Results.failedForNetworkingError:
                NSLog("Log out failed for networking error")
                self.showFailureAlert(
                    title: NSLocalizedString("LogoutFailureTitle", comment: "Logout failure alert title"),
                    message: NSLocalizedString("NetworkFailure", comment: "Network failure text"))
            default:
                break
            }
            
            // Clean up the UI
            self.setNetworkActivityStatus(active: false)
        }
    }
    
    func refresh() {
        // Setup the UI
        setNetworkActivityStatus(active: true)
        
        // Make the call
        networkRequests.refreshStudentInformation() { (logOutResult) in
            // Handle the login outcome
            switch logOutResult {
            case NetworkRequests.Results.success:
                NSLog("Refresh succeeded")
            case NetworkRequests.Results.failedForNetworkingError:
                NSLog("Refresh failed for networking error")
                self.showFailureAlert(
                    title: NSLocalizedString("RefreshFailureTitle", comment: "Refresh failure alert title"),
                    message: NSLocalizedString("NetworkFailure", comment: "Network failure text"))
            default:
                break
            }
            
            // Clean up the UI
            self.setNetworkActivityStatus(active: false)
        }

    }
    
    func showFailureAlert(title: String, message: String) {
        // Construct the alert ingredients
        let alertController: UIAlertController = UIAlertController(
            title: title,
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
    
    func setNetworkActivityStatus(active: Bool) {
        UIApplication.shared.isNetworkActivityIndicatorVisible = active
    }
    
}
