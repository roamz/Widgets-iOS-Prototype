//
//  PostsGatewayTestCase.swift
//  WidgetsPrototype
//
//  Created by solal on 24/07/2015.
//  Copyright (c) 2015 solal. All rights reserved.
//

import UIKit
import XCTest

class PostsGatewayTestCase: XCTestCase {
    
    func setEnv() {
        let envList = ["test": "file://\(NSBundle.mainBundle().resourcePath!)"]
        EnvManager.sharedInstance.envConfig(envList, env: "test", userHash: "")
    }
    
    func testGetPostsList() {
        self.setEnv()
        let loadedExpectation = expectationWithDescription("Loaded posts.")
        PostsGateway(widgetHash: "").fetch { (posts) -> Void in
            XCTAssertGreaterThan(posts.count, 0, "Failed to return posts.")
            loadedExpectation.fulfill()
        }
        
        waitForExpectationsWithTimeout(15, handler: { error in
            XCTAssertNil(error, "Error loading posts.")
        })
    }
    
}
