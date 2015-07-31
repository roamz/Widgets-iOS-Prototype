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
    
    private var envList: Dictionary<String, String>?
    private var env: String?
    
    func envConfig(envList: Dictionary<String, String>, env: String) {
        self.envList = envList
        
        if (envList[env] != nil) {
            self.env = envList[env]
        } else {
            println("Unknown env set - calls will fail.")
        }
    }
    
    func envURL() -> String {
        return self.env!
    }
    
}
