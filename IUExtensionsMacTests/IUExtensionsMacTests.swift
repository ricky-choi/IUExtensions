//
//  IUExtensionsMacTests.swift
//  IUExtensionsMacTests
//
//  Created by Jae Young Choi on 2017. 8. 14..
//  Copyright © 2017년 Appcid. All rights reserved.
//

import XCTest
import IUExtensionsMac

class IUExtensionsMacTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testString() {
        XCTAssertEqual("hello".uppercasedFirstCharacterOnly(), "Hello")
        XCTAssertEqual("h".uppercasedFirstCharacterOnly(), "H")
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
}
