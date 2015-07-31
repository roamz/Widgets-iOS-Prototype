//
//  WidgetsGatewayTestCase.swift
//  WidgetsPrototype
//
//  Created by solal on 24/07/2015.
//  Copyright (c) 2015 solal. All rights reserved.
//

import UIKit
import XCTest

class WidgetsGatewayTestCase: XCTestCase {
    
    func testGetWidgetsList() {
        EnvManager.sharedInstance.envConfig("file://\(NSBundle.mainBundle().resourcePath!)", userHash: "")
        let loadedExpectation = expectationWithDescription("Loaded widgets.")
        
        WidgetsGateway().fetch { (widgets) -> Void in
            XCTAssertGreaterThan(widgets.count, 0, "Failed to return widgets.")
            loadedExpectation.fulfill()
        }
        
        waitForExpectationsWithTimeout(15, handler: { error in
            XCTAssertNil(error, "Error loading widgets")
        })
    }
    
}
