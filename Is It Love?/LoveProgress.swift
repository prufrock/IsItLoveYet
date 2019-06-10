//
//  LoveProgress.swift
//  Is It Love?
//
//  Created by David Kanenwisher on 6/9/19.
//  Copyright © 2019 David Kanenwisher. All rights reserved.
//

import Foundation

class LoveProgress {
    public private(set) var value: Double
    
    private let step = 10.0
    private let floor = 0.0
    private let ceiling = 100.0

    init(initialProgress: Double) {
        value = initialProgress
    }
    
    func increment() {
        
        if value < ceiling {
            value = value + step
        }
    }
    
    func decrement() {
        
        if value > 0 {
            value = value - step
        }
    }
    
    func hasReachedLoveLimit() -> Bool {
        return (value >= ceiling)
    }
}
