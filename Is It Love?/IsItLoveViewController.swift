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

        isItLoveYet = IsItLoveYet(positiveWords: positiveWords, negativeWords: negativeWords, wordSelectionStrategy: Config.wordSelectionStrategy)

        setTitlesFor(leftButton, title: isItLoveYet.randomWord(.positive))
        setTitlesFor(rightButton, title: isItLoveYet.randomWord(.negative))
    }

    @IBAction func buttonPressed(_ button: UIButton) {

        // Get state from UI
        let title = buttonTitle(button)

        // Perform domain operation
        isItLoveYet.updateProgress(title)

        // Change UI in response to domain changes
        setTitlesFor(button, title: isItLoveYet.selectWord(title))
        loveProgressText = String(isItLoveYet.currentProgress())
        if isItLoveYet.hasReachedLoveLimit() {
            enableLoveButton(true)
            return
        } else {
            enableLoveButton(false)
            return
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

    private func setTitlesFor(_ button: UIButton, title: String) {
        
        button.setTitle(title, for: UIControl.State.normal)
        button.setTitle(title, for: UIControl.State.disabled)
    }
}
