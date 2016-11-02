//
//  StudentTableViewController.swift
//  OnTheMap
//
//  Created by Timothy Savard on 11/1/16.
//  Copyright © 2016 Timothy Savard. All rights reserved.
//

import UIKit

class StudentTableViewController: UITableViewController {
    
    // MARK:- Table View Controller Methods
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.tableView.reloadData()
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Session.data.studentInformation.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // Get a fresh cell
        let cellIdentifier: String = "cell"
        let cell: UITableViewCell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier)!
        
        // Decorate & return the cell
        let studentInfo = Session.data.studentInformation[indexPath.row]
        let studentName: String = studentInfo.firstName + " " + studentInfo.lastName
        
        cell.textLabel?.text = studentName
        cell.detailTextLabel?.text = ""
        
        return cell
    }
    
}
