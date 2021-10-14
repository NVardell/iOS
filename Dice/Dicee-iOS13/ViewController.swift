//
//  ViewController.swift
//  Dicee-iOS13
//
//  Created by Angela Yu on 11/06/2019.
//  Copyright © 2019 London App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var diceIV1: UIImageView!
    
    @IBOutlet weak var diceIV2: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        diceIV1.image = #imageLiteral(resourceName: "DiceSix")
        diceIV2.image = #imageLiteral(resourceName: "DiceSix")
        diceIV1.alpha = 0.75
        diceIV2.alpha = 0.75
    }

    @IBAction func rollButtonPressed(_ sender: UIButton) {
        print("I did it.")
        diceIV1.image = #imageLiteral(resourceName: "DiceFour")
        diceIV2.image = #imageLiteral(resourceName: "DiceFour")
    }
    
    
}

