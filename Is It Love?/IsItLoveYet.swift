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

    private var positiveWords = [String]()
    private var negativeWords = [String]()

    init(initialPositiveWords: [String], initialNegativeWords: [String]) {

        progress = LoveProgress(initialProgress: 0.0)
        positiveWords = initialPositiveWords
        negativeWords = initialNegativeWords
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

    func isPositiveWord(_ word: String) -> Bool {
        return positiveWords.firstIndex(of: word) != nil
    }

    func updateProgress(_ word: String) {
        if (isPositiveWord(word)) {
            progress.increment()
        } else {
            progress.decrement()
        }
    }
}
