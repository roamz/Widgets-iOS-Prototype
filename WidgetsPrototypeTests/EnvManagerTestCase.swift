//
//  EnvManagerTestCase.swift
//  WidgetsPrototype
//
//  Created by solal on 31/07/2015.
//  Copyright (c) 2015 solal. All rights reserved.
//

import UIKit
import XCTest

class EnvManagerTestCase: XCTestCase {
    
    func testEnvManagerInitialConfig() {
        EnvManager.sharedInstance.envConfig("http//hello.world", userHash: "HelloWorld")
        XCTAssertNotNil(EnvManager.sharedInstance.env!, "Env was not set properly.")
        XCTAssertNotNil(EnvManager.sharedInstance.userHash!, "User hash was not set properly")
    }
    
    func testEnvIsSet() {
        EnvManager.sharedInstance.envConfig("http//hello.world", userHash: "HelloWorld")
        XCTAssertEqual(EnvManager.sharedInstance.env!, "http//hello.world", "Env was not set properly.")
    }
    
    func testUserHashIsSet() {
        EnvManager.sharedInstance.envConfig("http//hello.world", userHash: "HelloWorld")
        XCTAssertEqual(EnvManager.sharedInstance.userHash!, "HelloWorld", "User hash was not set properly.")
    }

}
