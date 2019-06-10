//
//  LoveProgress.swift
//  Is It Love?Tests
//
//  Created by David Kanenwisher on 6/9/19.
//  Copyright © 2019 David Kanenwisher. All rights reserved.
//

import XCTest
@testable import Is_It_Love_

class LoveProgressTests: XCTestCase {
    
    private var progress: LoveProgress?

    override func setUp() {
        progress = LoveProgress(initialProgress: 0.0)
    }

    func testWhenItsCreated() {
        XCTAssertEqual(0.0, progress?.value, "it should start at 0")
        XCTAssertEqual(false, progress?.hasReachedLoveLimit(), "it should not have reached the limit")
    }
    
    func testWhenItsIncremented() {
        
        progress?.increment()
        
        XCTAssertEqual(10.0, progress?.value, "it should increase by 10")
        XCTAssertEqual(false, progress?.hasReachedLoveLimit(), "it should not have reached the limit")
    }
    
    func testWhenItsIncrementedPastItsCeiling() {
        
        for _ in 1...11 {
            progress?.increment()
        }
        
        XCTAssertEqual(100.0, progress?.value, "it shouldn't go beyond the ceiling")
        XCTAssertEqual(true, progress?.hasReachedLoveLimit(), "it should have reached the limit")
    }
    
    func testWhenItsDecrementedPastItsFloor() {
        
        progress?.decrement()
        
        XCTAssertEqual(0.0, progress?.value, "it should stay at 0")
        XCTAssertEqual(false, progress?.hasReachedLoveLimit(), "it should not have reached the limit")
    }
    
    func testWhenItsWhenItsIncrementTwiceThenDecremented() {
        
        progress?.increment()
        progress?.increment()
        progress?.decrement()
        
        XCTAssertEqual(10.0, progress?.value, "it should bet at 10")
        XCTAssertEqual(false, progress?.hasReachedLoveLimit(), "it should not have reached the limit")
    }
}
