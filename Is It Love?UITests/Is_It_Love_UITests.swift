//
//  Is_It_Love_UITests.swift
//  Is It Love?UITests
//
//  Created by David Kanenwisher on 6/7/19.
//  Copyright © 2019 David Kanenwisher. All rights reserved.
//

import XCTest

class Is_It_Love_UITests: XCTestCase {
    
    var app: XCUIApplication!

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // UI tests must launch the application that they test. Doing this in setup will make sure it happens for each test method.
        app = XCUIApplication()
        app.launchEnvironment = ["testing": "yes"]
        app.launch()

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testWhenTheApplicationLaunches() {
        // Use recording to get started writing UI tests.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        let leftButton = app.buttons["left-button"]
        let rightButton = app.buttons["right-button"]
        let resetButton = app.buttons["reset-button"]
        let loveButton = app.buttons["love-button"]
        
        XCTAssertTrue(leftButton.exists, "the left button should exist")
        XCTAssertTrue(rightButton.exists, "the right button should exist")
        XCTAssertTrue(resetButton.exists, "the reset button should exist")
        XCTAssertTrue(loveButton.exists, "the love button should exist")

        XCTAssertEqual(app.staticTexts["0.0"].exists, true, "love value starts at 0.0")
        
        // When left button is tapped
        leftButton.tap()
        XCTAssertEqual(app.staticTexts["10.0"].exists, true, "love value increases by 10.0 to 10.0")

        // When the right button is tapped
        rightButton.tap()
        XCTAssertEqual(app.staticTexts["0.0"].exists, true, "love value decreases by 10.0 to 0.0")
        
        // When the left button is tapped 10 times
        for _ in 1...10 {
            leftButton.tap()
        }
        XCTAssertEqual(app.staticTexts["100.0"].exists, true, "love value increases by 10.0 to 100.0")
        
        // When the love button is tapped
        loveButton.tap()
        XCTAssertEqual(app.staticTexts["❤️"].exists, true, "love value changes to ❤️")
        
        // When the reset button is tapped
        resetButton.tap()
        XCTAssertEqual(app.staticTexts["0.0"].exists, true, "love value changes to 0.0")
    }

}
