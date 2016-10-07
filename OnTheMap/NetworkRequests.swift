//
//  NetworkRequests.swift
//  OnTheMap
//
//  Created by Savard, Tim on 10/1/16.
//  Copyright © 2016 Timothy Savard. All rights reserved.
//

import Foundation

class NetworkRequests {
    
    enum LogInResults {
        case success
        case failedForCredentials
        case failedForNetworkingError
    }
    
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
                    completionHandler(LogInResults.failedForNetworkingError)
                }
            }
        
            // Assuming communication was successful, check the result
            let subData = data?.subdata(in: 5..<data!.count)
            do {
                let response: Dictionary = try JSONSerialization.jsonObject(with: subData!) as! Dictionary<String, Any>
                
                if let status: Int = response["status"] as? Int, status == 403 {
                    NSLog("Log in failed for invalid credentials")
                    DispatchQueue.main.async() {
                        completionHandler(LogInResults.failedForCredentials)
                    }
                } else {
                    NSLog("Log in successful")
                    DispatchQueue.main.async() {
                        completionHandler(LogInResults.success)
                    }
                }
            } catch {
                // Assume that the data was currupted as received
                NSLog("Error serializing log in response: \(error)")
                DispatchQueue.main.async() {
                    completionHandler(LogInResults.failedForNetworkingError)
                }
            }
        }
        task.resume()
    }
    
}
