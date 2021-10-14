//
//  ViewController.swift
//  Dicee-iOS13
//
//  Created by Angela Yu on 11/06/2019.
//  Copyright © 2019 London App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    // UI Lables
    @IBOutlet weak var diceTotal: UILabel!
    
    // UI Images
    @IBOutlet weak var diceIV1: UIImageView!
    @IBOutlet weak var diceIV2: UIImageView!
    
    // Local Variables
    var topDie = Int.random(in: 0...5)
    var bottomDie = Int.random(in: 0...5)
    let dice = [#imageLiteral(resourceName: "DiceOne"), #imageLiteral(resourceName: "DiceTwo"), #imageLiteral(resourceName: "DiceThree"), #imageLiteral(resourceName: "DiceFour"), #imageLiteral(resourceName: "DiceFive"), #imageLiteral(resourceName: "DiceSix")]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        diceTotal.text = "\(2 + topDie + bottomDie)"
        
        diceIV1.alpha = 0.75
        diceIV2.alpha = 0.75
    }

    @IBAction func rollButtonPressed(_ sender: UIButton) {
        topDie = Int.random(in: 1...5)
        bottomDie = Int.random(in: 1...5)
        diceTotal.text = "\(2 + topDie + bottomDie)"
        
        /**
            NTFS ~
              If I wasn't trying to calculate the total
                diceIV1.image = dice.randomElement()
                diceIV2.image = dice.randomElement()
        */
        diceIV1.image = dice[topDie]
        diceIV2.image = dice[bottomDie]
    }
    
    
}

