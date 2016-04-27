//
//  EnvManager.swift
//  WidgetsPrototype
//
//  Created by solal on 28/07/2015.
//  Copyright (c) 2015 solal. All rights reserved.
//

import Foundation

class EnvManager {
    static let sharedInstance = EnvManager()
    var env: String?
    var userHash: String?
    
    func envConfig(env: String, userHash: String) {
        self.env = env
        self.userHash = userHash
    }
}
