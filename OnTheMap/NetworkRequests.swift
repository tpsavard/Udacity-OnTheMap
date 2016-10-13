//
//  NetworkRequests.swift
//  OnTheMap
//
//  Created by Savard, Tim on 10/1/16.
//  Copyright © 2016 Timothy Savard. All rights reserved.
//

import Foundation

class NetworkRequests {
    
    enum Results {
        case success
        case failedForNetworkingError
        case failedForCredentials
    }
    
    
    // MARK:- Action Methods
    
    func logIn(username: String, password: String, completionHandler: @escaping (Any) -> ()) {
        // Setup request
        var request = URLRequest(url: URL(string: "https://www.udacity.com/api/session")!)
        request.httpMethod = "POST"
        request.addValue("application/json", forHTTPHeaderField: "Accept")
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpBody = "{\"udacity\": {\"username\": \"\(username)\", \"password\": \"\(password)\"}}".data(using: String.Encoding.utf8)
        
        // Send the request to Udacity
        NSLog("Attemping login with \(username)")
        let session = URLSession.shared
        let task = session.dataTask(with: request) { data, response, error in
            // Catch any communication errors
            if (error != nil) {
                NSLog("Log in failed for networking error: \(error)")
                DispatchQueue.main.async() {
                    completionHandler(Results.failedForNetworkingError)
                }
            }
        
            // Try to parse whatever we received; if we fail, assume that the data was currupted as received
            let subData: Data? = data?.subdata(in: 5..<data!.count)
            guard let response = self.fromJSONToDict(data: subData) else {
                NSLog("Error serializing log in response: \(error)")
                DispatchQueue.main.async() {
                    completionHandler(Results.failedForNetworkingError)
                }
                return
            }
            
            // Check the intelligble structure
            if let status: Int = response["status"] as? Int, status == 403 {
                NSLog("Log in failed for invalid credentials")
                DispatchQueue.main.async() {
                    completionHandler(Results.failedForCredentials)
                }
            } else {
                NSLog("Log in successful")
                DispatchQueue.main.async() {
                    completionHandler(Results.success)
                }
            }
        }
        task.resume()
    }
    
    
    // MARK:- Other Methods
    
    func fromJSONToDict(data: Data?) -> Dictionary<String, Any?>? {
        do {
            let dict: Dictionary<String, Any> = try JSONSerialization.jsonObject(with: data!) as! Dictionary<String, Any>
            return dict
        } catch {
            return nil
        }
    }
    
}
