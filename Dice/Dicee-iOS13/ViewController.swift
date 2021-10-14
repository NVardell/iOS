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
    var topDie = 0
    var bottomDie = 0
    var dice = [#imageLiteral(resourceName: "DiceOne"), #imageLiteral(resourceName: "DiceTwo"), #imageLiteral(resourceName: "DiceThree"), #imageLiteral(resourceName: "DiceFour"), #imageLiteral(resourceName: "DiceFive"), #imageLiteral(resourceName: "DiceSix")]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        diceTotal.text = "\(topDie + bottomDie)"
        
        
//        diceIV1.alpha = 0.75
        diceIV2.alpha = 0.75
    }

    @IBAction func rollButtonPressed(_ sender: UIButton) {
        print("I did it.")
        diceIV1.image = dice[topDie]
        diceIV2.image = dice[bottomDie]
    }
    
    
}

