//
//  CalculatorUITests.swift
//  CalculatorUITests
//
//  Created by Chandler, Sean on 5/16/17.
//  Copyright © 2017 Sean Chandler. All rights reserved.
//

import XCTest

class CalculatorUITests: XCTestCase {
        
    override func setUp() {
        super.setUp()
        
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false
        // UI tests must launch the application that they test. Doing this in setup will make sure it happens for each test method.
        XCUIApplication().launch()

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    
    func testDisplay() {        
        let app = XCUIApplication()
        app.buttons["1"].tap()
        app.buttons["0"].tap()
        app.buttons["."].tap()
        app.buttons["5"].tap()
        XCTAssertTrue(app.staticTexts["10.5"].exists)
    }
    
    func testAdd() {
        let app = XCUIApplication()
        app.buttons["5"].tap()
        app.buttons["+"].tap()
        app.buttons["4"].tap()
        app.buttons["="].tap()
        XCTAssertTrue(app.staticTexts["9.0"].exists)
    }
    
    func testSubtract() {
        let app = XCUIApplication()
        app.buttons["6"].tap()
        app.buttons["−"].tap()
        app.buttons["2"].tap()
        app.buttons["="].tap()
        XCTAssertTrue(app.staticTexts["4.0"].exists)
    }
    
    func testMultiply() {
        let app = XCUIApplication()
        app.buttons["2"].tap()
        app.buttons["×"].tap()
        app.buttons["8"].tap()
        app.buttons["="].tap()
        XCTAssertTrue(app.staticTexts["16.0"].exists)
    }
    
    func testDivide() {
        let app = XCUIApplication()
        app.buttons["7"].tap()
        app.buttons["÷"].tap()
        app.buttons["2"].tap()
        app.buttons["="].tap()
        XCTAssertTrue(app.staticTexts["3.5"].exists)
    }
    
    func testSqrt() {
        let app = XCUIApplication()
        app.buttons["9"].tap()
        app.buttons["√"].tap()
        XCTAssertTrue(app.staticTexts["3.0"].exists)
    }
}
