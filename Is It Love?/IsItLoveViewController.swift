//
//  IsItLoveViewController.swift
//  Is It Love?
//
//  Created by David Kanenwisher on 6/8/19.
//  Copyright © 2019 David Kanenwisher. All rights reserved.
//

import UIKit

enum WordType {
    case positive, negative, none
}

class IsItLoveViewController: UIViewController {
    
    @IBOutlet var loveProgressLabel: UILabel!
    
    @IBOutlet var loveButton: UIButton!
    
    @IBOutlet var leftButton: UIButton!
    
    @IBOutlet var rightButton: UIButton!
    
    private var positiveWords = [String]()
    private var negativeWords = [String]()
    
    private var isItLoveYet: IsItLoveYet!
    
    private var loveProgressText: String = "0.0" {
        didSet {
            updateLoveProgressLabel()
        }
    }
    
    override func viewDidLoad() {
        
        super.viewDidLoad()

        enableLoveButton(false)

        positiveWords = ["Joy", "Elation", "Cheer", "Gratitude", "Friend"]
        negativeWords = ["Envy", "Cruel", "Despair", "Suffer", "Agony"]

        isItLoveYet = IsItLoveYet(initialPositiveWords: positiveWords, initialNegativeWords: negativeWords)

        setTitlesFor(leftButton, title: positiveWord())
        setTitlesFor(rightButton, title: negativeWord())
    }

    @IBAction func buttonPressed(_ button: UIButton) {

        var wordType: WordType;

        // Get state from UI
        let title = buttonTitle(button)

        // Perform domain operation
        if isItLoveYet.isPositiveWord(title) {
            wordType = .positive
        } else {
            wordType = .negative
        }

        updateProgress(wordType)

        // Change UI in response to domain changes
        loveProgressText = String(isItLoveYet.currentProgress())
        setTitlesFor(button, title: selectWord(wordType))
        if isItLoveYet.hasReachedLoveLimit() {
            enableLoveButton(true)
            return
        } else {
            enableLoveButton(false)
            return
        }
    }
    
    private func updateProgress(_ type: WordType) {
        switch type {
        case .positive,
             .none:
            isItLoveYet.incrementProgress()
        case .negative:
            isItLoveYet.decrementProgress()
        }
    }

    private func selectWord(_ type: WordType) -> String {
        switch type {
            case .positive,
                 .none:
                return positiveWord()
            case .negative:
                return negativeWord()
        }
    }
    
    @IBAction func loveButtonPressed(_ button: UIButton) {
        loveProgressText = "❤️"
    }
    
    @IBAction func reset(_ button: UIButton) {
        
        //Perform domain operation
        isItLoveYet.resetProgress()
        
        // Change UI in response to domain changes
        enableLoveButton(false)
        loveProgressText = String(isItLoveYet.currentProgress())
    }
    
    private func updateLoveProgressLabel() {
        
        guard let loveProgress = loveProgressLabel else {
            return
        }
        
        loveProgress.text = loveProgressText
    }

    private func buttonTitle(_ button:UIButton) -> String {
        return button.currentTitle ?? ""
    }
    
    private func enableLoveButton(_ enabled: Bool) {
        loveButton.isEnabled = enabled
    }
    
    private func positiveWord() -> String {
        
        let idx = arc4random_uniform(UInt32(positiveWords.count))
        return positiveWords[Int(idx)]
    }
    
    private func negativeWord() -> String {
        
        let idx = arc4random_uniform(UInt32(negativeWords.count))
        return negativeWords[Int(idx)]
    }
    
    private func setTitlesFor(_ button: UIButton, title: String) {
        
        button.setTitle(title, for: UIControl.State.normal)
        button.setTitle(title, for: UIControl.State.disabled)
    }
}
