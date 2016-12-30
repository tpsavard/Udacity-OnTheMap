//
//  SessionData.swift
//  OnTheMap
//
//  Created by Timothy Savard on 10/10/16.
//  Copyright © 2016 Timothy Savard. All rights reserved.
//

import Foundation

class Session {
    
    class Data {
        var userID: String = ""
        var userFirstName: String = ""
        var userLastName: String = ""
        var studentInformation: [StudentInformation] = []
    }
    
    // Globally accessible, consistent model instances
    static let data: Data = Data()
    static let networkRequests: NetworkRequests = NetworkRequests()
    
}
