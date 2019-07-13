//
//  IsItLoveYet.swift
//  Is It Love?
//
//  Created by David Kanenwisher on 6/10/19.
//  Copyright © 2019 David Kanenwisher. All rights reserved.
//

import Foundation

enum WordSelectionStrategy {
    case matching, random
}

class IsItLoveYet {
    var progress: LoveProgress

    private var positiveWords = [String]()
    private var negativeWords = [String]()
    private var wordSelectionStrategy: WordSelectionStrategy

    init(positiveWords: [String], negativeWords: [String], wordSelectionStrategy: WordSelectionStrategy = .matching) {

        progress = LoveProgress(initialProgress: 0.0)
        self.positiveWords = positiveWords
        self.negativeWords = negativeWords
        self.wordSelectionStrategy = wordSelectionStrategy
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
        switch wordSelectionStrategy {
        case .matching:
            return selectMatchingWordType(word)
        case .random:
            return selectRandomWordType(word)
        }
    }
    
    func randomWord(_ type: WordType) -> String {
        switch type {
        case .positive:
            return positiveWord()
        case .negative:
            return negativeWord()
        case .none:
            return (random(2) > 0 ? positiveWord() : negativeWord())
        }
    }

    private func selectMatchingWordType(_ word: String) -> String {
        return isNegativeWord(word) ? randomWord(.negative) : randomWord(.positive)
    }

    private func selectRandomWordType(_ word: String) -> String {
        return randomWord(.none)
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
