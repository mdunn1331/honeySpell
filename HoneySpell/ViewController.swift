//
//  ViewController.swift
//  HoneySpell
//
//  Created by Dunn, Michael R on 3/11/19.
//  Copyright © 2019 Dunn, Michael R. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var buttonPos1: LetterButton!
    @IBOutlet var buttonPos2: LetterButton!
    @IBOutlet var buttonPos3: LetterButton!
    @IBOutlet var buttonPos4: LetterButton!
    @IBOutlet var buttonPos5: LetterButton!
    @IBOutlet var buttonPos6: LetterButton!
    @IBOutlet var buttonPos7: LetterButton!
    @IBOutlet var currentWordLabel: UILabel!
    
    var letterList = ["n", "t", "o", "y", "k", "m", "e"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Set characters
        buttonPos1.character = letterList[0]
        buttonPos2.character = letterList[1]
        buttonPos3.character = letterList[2]
        buttonPos4.character = letterList[3]
        buttonPos5.character = letterList[4]
        buttonPos6.character = letterList[5]
        buttonPos7.character = letterList[6]
        
        //Set action on press
        buttonPos1.addTarget(self, action: #selector(didPressButton(button:)), for: .touchUpInside)
        buttonPos2.addTarget(self, action: #selector(didPressButton(button:)), for: .touchUpInside)
        buttonPos3.addTarget(self, action: #selector(didPressButton(button:)), for: .touchUpInside)
        buttonPos4.addTarget(self, action: #selector(didPressButton(button:)), for: .touchUpInside)
        buttonPos5.addTarget(self, action: #selector(didPressButton(button:)), for: .touchUpInside)
        buttonPos6.addTarget(self, action: #selector(didPressButton(button:)), for: .touchUpInside)
        buttonPos7.addTarget(self, action: #selector(didPressButton(button:)), for: .touchUpInside)
        
        //Set essential letter
        buttonPos1.isEssential = true
    }
    
    //MARK: - Button Actions
    @objc private func didPressButton(button:LetterButton) {
        currentWordLabel.text = (currentWordLabel.text ?? "") + button.appendableCharacter
    }
    
    @IBAction func checkCurrentWord(_ sender: Any) {
        guard let wordToCheck = currentWordLabel.text else { return }
        let misspelling = UITextChecker().rangeOfMisspelledWord(in: wordToCheck,
                                                                range: NSRange(0..<wordToCheck.count),
                                                                startingAt: 0,
                                                                wrap: true,
                                                                language: "en-US")
        if misspelling.location != NSNotFound {
            let alert = UIAlertController(title: "Failed Check", message: "Not a real word", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: NSLocalizedString("OK", comment: "Default action"), style: .default, handler:nil))
            self.present(alert, animated: true, completion: nil)
        } else if !wordToCheck.contains("n") {
            let alert = UIAlertController(title: "Failed Check", message: "Doesn't contain essential char", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: NSLocalizedString("OK", comment: "Default action"), style: .default, handler:nil))
            self.present(alert, animated: true, completion: nil)
        } else if wordToCheck.count < 4 {
            let alert = UIAlertController(title: "Failed Check", message: "Word isn't long enough!", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: NSLocalizedString("OK", comment: "Default action"), style: .default, handler:nil))
            self.present(alert, animated: true, completion: nil)
        } else {
            let alert = UIAlertController(title: "Success", message: "\(wordToCheck) was a valid word", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: NSLocalizedString("OK", comment: "Default action"), style: .default, handler:nil))
            self.present(alert, animated: true, completion: nil)
        }
    }
    
    @IBAction func deleteLetter(_ sender: Any) {
        guard let currText = currentWordLabel.text,
            currText.count > 0 else { return }
        currentWordLabel.text = "\(currText.dropLast())"
    }
}

