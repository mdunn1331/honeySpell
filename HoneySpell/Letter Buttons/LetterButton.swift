//
//  LetterButton.swift
//  HoneySpell
//
//  Created by Dunn, Michael R on 3/11/19.
//  Copyright © 2019 Dunn, Michael R. All rights reserved.
//

import UIKit

class LetterButton: UIButton {
    var character: String? {
        didSet {
            setTitle(character, for: .normal)
        }
    }
    var isEssential: Bool = false {
        didSet {
            if isEssential {
                backgroundColor = UIColor.yellow
            }
        }
    }
    var appendableCharacter: String { return character ?? ""}
}
