//
//  Config.swift
//  Is It Love?Tests
//
//  Created by David Kanenwisher on 7/13/19.
//  Copyright © 2019 David Kanenwisher. All rights reserved.
//

import XCTest
@testable import Is_It_Love_

class ConfigTests: XCTestCase {

    func test_it_returns_a_value_that_has_been_set() {
        Config.wordSelectionStrategy = WordSelectionStrategy.random
        XCTAssertEqual(WordSelectionStrategy.random, Config.wordSelectionStrategy)
    }
}
