//
//  IsItLoveYetTests.swift
//  Is It Love?Tests
//
//  Created by David Kanenwisher on 6/11/19.
//  Copyright © 2019 David Kanenwisher. All rights reserved.
//

import XCTest
@testable import Is_It_Love_

class IsItLoveYetTests: XCTestCase {

    var domain: IsItLoveYet!

    override func setUp() {
        domain = IsItLoveYet(initialPositiveWords: ["Joy", "Elation", "Cheer", "Gratitude", "Friend"], initialNegativeWords: ["Envy", "Cruel", "Despair", "Suffer", "Agony"])
    }

    func test_it_starts_at_0() {

        XCTAssertEqual(0.0, domain.currentProgress())
        XCTAssertEqual(false, domain.hasReachedLoveLimit())
    }

    func test_it_increments_by_10() {

        domain.incrementProgress()

        XCTAssertEqual(10.0, domain.currentProgress())
    }

    func test_it_decrements_by_10() {

        for _ in 1...2 {
            domain.incrementProgress()
        }
        XCTAssertEqual(20.0, domain.currentProgress())

        domain.decrementProgress()

        XCTAssertEqual(10.0, domain.currentProgress())
    }

    func test_it_resets_to_0() {

        domain.incrementProgress()

        domain.resetProgress()

        XCTAssertEqual(0.0, domain.currentProgress())
    }

    func test_it_can_reach_the_love_limit() {

        for _ in 1...10 {
            domain.incrementProgress()
        }
        XCTAssertEqual(100.0, domain.currentProgress())

        XCTAssertEqual(true, domain.hasReachedLoveLimit())
    }

    func test_it_doesnt_confirm_a_positive_word() {
        XCTAssertFalse(domain.isPositiveWord("Envy"));
    }

    func test_it_confirms_a_positive_word() {
        XCTAssertTrue(domain.isPositiveWord("Joy"));
    }
}
