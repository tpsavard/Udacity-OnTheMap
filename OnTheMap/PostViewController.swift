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
        return 2
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        switch section {
        case 0:
            return "1"
        case 1:
            return "2"
        default:
            return ""
        }
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // Get a fresh cell
        let cellIdentifier: String = "fieldCell"
        let cell: UITableViewCell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier)!
        
        // TODO: Decorate & return the cell
        
        return cell
    }

}
