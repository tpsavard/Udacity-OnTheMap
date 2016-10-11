//
//  SessionData.swift
//  OnTheMap
//
//  Created by Timothy Savard on 10/10/16.
//  Copyright © 2016 Timothy Savard. All rights reserved.
//

import Foundation

class SessionData {
    
    class Data {
        var studentInformation: [StudentInformation] = []
    }
    
    // Globally accessible, consistent model instance
    static let data: Data = Data()
    
}
