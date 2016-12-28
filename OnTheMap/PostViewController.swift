//
//  PostViewController.swift
//  OnTheMap
//
//  Created by Timothy Savard on 12/6/16.
//  Copyright © 2016 Timothy Savard. All rights reserved.
//

import UIKit

class PostViewController: UITableViewController {
    
    @IBOutlet weak var urlField: UITextField!
    @IBOutlet weak var doneButton: UIButton!
    
    var locationFound: Bool = false
    var locationCellCount: Int = 1

    // MARK:- Table View Controller Methods

    override func numberOfSections(in tableView: UITableView) -> Int {
        // Sections for location, url, and submit/cancel buttons
        return 3
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            // Map cell count changes depending on text field content
            return locationCellCount
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
        case "map":
            break
        case "url":
            break
        case "done":
            break
        default:
            break
        }
        
        return cell
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
            tableView.beginUpdates()
            
            locationCellCount = 2
            tableView.insertRows(at: [IndexPath(row: 1, section: 0)], with: .automatic)
            
            tableView.endUpdates()
        }
    }
    
    // MARK:- Other Methods
    
    func enableDone() {
        //doneButton.isEnabled = !(urlField.text!.isEmpty) && locationFound
        return
    }

}
