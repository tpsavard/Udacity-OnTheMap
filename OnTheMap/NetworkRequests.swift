//
//  NetworkRequests.swift
//  OnTheMap
//
//  Created by Savard, Tim on 10/1/16.
//  Copyright © 2016 Timothy Savard. All rights reserved.
//

import Foundation

// The following is sample code for making Udacity login request

//var request = URLRequest(url: URL(string: "https://www.udacity.com/api/session")!)
//request.httpMethod = "POST"
//request.addValue("application/json", forHTTPHeaderField: "Accept")
//request.addValue("application/json", forHTTPHeaderField: "Content-Type")
//request.httpBody = "{\"udacity\": {\"username\": \"timsav@amazon.com\", \"password\": \"****\"}}".data(using: String.Encoding.utf8)
//
//let session = URLSession.shared
//let task = session.dataTask(with: request) { data, response, error in
//    if error != nil { // Handle error…
//        return
//    }
//    
//    let newData = data?.subdata(in: 5..<data!.count)
//    
//    do {
//        let dict = try JSONSerialization.jsonObject(with: newData!)
//        print(dict)
//    } catch {
//        print("Error serializing response: \(error)")
//    }
//}
//task.resume()
