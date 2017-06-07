//
//  newPermitViewTest.swift
//  Permit-to-work
//
//  Created by Danick on 07-06-17.
//  Copyright © 2017 danick sikkema. All rights reserved.
//

import XCTest
@testable import Permit_to_work

class newPermitViewTest: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testOutletExist() {
        let newPermitViewController = NewPermitViewController()
        XCTAssertNil(newPermitViewController.textfieldName)
    }
}
