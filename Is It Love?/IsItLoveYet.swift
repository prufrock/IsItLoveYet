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

    func isNegativeWord(_ word: String) -> Bool {
        return negativeWords.firstIndex(of: word) != nil
    }

    func updateProgress(_ word: String) {
        if (isPositiveWord(word)) {
            progress.increment()
        } else {
            progress.decrement()
        }
    }

    func selectWord(_ word: String) -> String {
        return isNegativeWord(word) ? randomWord(.negative) : randomWord(.positive)
    }

    func randomWord(_ type: WordType) -> String {
        switch type {
        case .positive,
             .none:
            return positiveWord()
        case .negative:
            return negativeWord()
        }
    }

    private func positiveWord() -> String {
        return positiveWords[random(positiveWords.count)]
    }

    private func negativeWord() -> String {
        return negativeWords[random(negativeWords.count)]
    }

    private func random(_ max: Int) -> Int {
        return Int(arc4random_uniform(UInt32(max)))
    }
}
