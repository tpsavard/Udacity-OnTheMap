//
//  PostViewController.swift
//  OnTheMap
//
//  Created by Timothy Savard on 12/6/16.
//  Copyright © 2016 Timothy Savard. All rights reserved.
//

import UIKit

class PostViewController: UITableViewController {
    
    weak var urlField: UITextField!
    weak var doneButton: UIButton!
    
    var locationFound: Bool = false
    var locationShown: Bool = false

    // MARK:- Table View Controller Methods

    override func numberOfSections(in tableView: UITableView) -> Int {
        // Sections for location, url, and submit/cancel buttons
        return 3
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            // Map cell count changes depending on text field content
            return (locationShown ? 2 : 1)
        case 1:
            // One cell to URL
            return 1
        case 2:
            // Two cells for the buttons (one per)
            return 2
        default:
            return 0
        }
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // Determine the correct cell
        var cellIdentifier: String = ""
        switch (indexPath.section, indexPath.row) {
        case (0,0):
            cellIdentifier = "location"
        case (0,1):
            cellIdentifier = "map"
        case (1,0):
            cellIdentifier = "url"
        case (2,0):
            cellIdentifier = "done"
        case (2,1):
            cellIdentifier = "cancel"
        default:
            break
        }
        
        // Get a fresh cell
        let cell: UITableViewCell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier)!
        
        // TODO: Decorate & return the cell
        switch cellIdentifier {
        case "url":
            if let urlView = cell.contentView.viewWithTag(2) as? UITextField {
                urlField = urlView
            }
        case "done":
            if let doneView = cell.contentView.viewWithTag(3) as? UIButton {
                doneButton = doneView
            }
        default:
            break
        }
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        // Specify a custom height for the Map cell
        if indexPath.section == 0 && indexPath.row == 1 {
            return 268.0
        } else {
            return UITableViewAutomaticDimension
        }
    }
    
    // MARK:- UI Methods
    
    @IBAction func cancel(sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func textFieldUpdated(sender: AnyObject) {
        enableDone()
    }
    
    @IBAction func textFieldDone(sender: UITextField) {
        // For either text field, drop the keyboard and end editing
        sender.resignFirstResponder()
        
        // For the location field, look up the location
        if sender.tag == 1 {
            // Look up the given location name
            
            // Add an annotation for the resolved location
            
            // Show the map cell
            if !locationShown {
                tableView.beginUpdates()
                
                locationShown = true
                tableView.insertRows(at: [IndexPath(row: 1, section: 0)], with: .automatic)
                
                tableView.endUpdates()
            }
        }
    }
    
    // MARK:- Other Methods
    
    func enableDone() {
        doneButton.isEnabled = !(urlField.text!.isEmpty) && locationFound
    }

}
