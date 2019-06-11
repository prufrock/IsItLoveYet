//
//  IsItLoveYet.swift
//  Is It Love?
//
//  Created by David Kanenwisher on 6/10/19.
//  Copyright © 2019 David Kanenwisher. All rights reserved.
//

import Foundation

class IsItLoveYet {
    var progress: LoveProgress
    
    init() {
        progress = LoveProgress(initialProgress: 0.0)
    }
    
    func incrementProgress() {
        progress.increment()
    }
    
    func decrementProgress() {
        progress.decrement()
    }
    
    func currentProgress() -> Double {
        return progress.value
    }
    
    func resetProgress() {
        progress = LoveProgress(initialProgress: 0.0)
    }
    
    func hasReachedLoveLimit() -> Bool {
        return progress.hasReachedLoveLimit()
    }
}
