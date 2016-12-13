//
//  PostViewController.swift
//  OnTheMap
//
//  Created by Timothy Savard on 12/6/16.
//  Copyright © 2016 Timothy Savard. All rights reserved.
//

import UIKit

class PostViewController: UITableViewController {

    // MARK:- Table View Controller Methods

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0,1:
            return 1
        case 2:
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
        
        return cell
    }

}
