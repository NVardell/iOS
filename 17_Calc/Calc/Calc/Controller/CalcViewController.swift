//
//  CalcViewController.swift
//  Calculator
//
//  Created by Nate V. on 12/02/2021.
//

import UIKit

class CalcViewController: UIViewController {
    
    var currentTotal = "0"
    var finishedTyping = true
    @IBOutlet weak var displayLabel: UILabel!
    
    
    
    @IBAction func calcButtonPressed(_ sender: UIButton) {
        
        // Reset Finished Typing
        finishedTyping = true
        
        
        //What should happen when a non-number button is pressed
        if let operation = sender.currentTitle {
            switch operation {
                case "AC":
                    currentTotal = "0"
                    displayLabel.text = currentTotal
                default:
                    displayLabel.text = "0"
            }
        }
        
        
    }

    
    @IBAction func numButtonPressed(_ sender: UIButton) {
        
        //What should happen when a number is entered into the keypad
        if let numValue = sender.currentTitle {

            if finishedTyping && numValue != "0" {
                displayLabel.text = numValue
                finishedTyping = false
            } else {
                displayLabel.text = displayLabel.text! + numValue
            }
        }
    }
    
    func updateTotalLabel() {
        print("Updating Total.")
    }

}

