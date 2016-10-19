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
        
    }
    
    func refresh() {
        
    }
    
}
