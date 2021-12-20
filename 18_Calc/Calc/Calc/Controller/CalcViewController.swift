//
//  CalcViewController.swift
//  Calculator
//
//  Created by Nate V. on 12/02/2021.
//

import UIKit

class CalcViewController: UIViewController {
    
    private var finishedTyping = true
    private var calc = CalculatorLogic()
    @IBOutlet weak var displayLabel: UILabel!
    
    // Current Label Value
    private var displayValue: Double {
        get {
            guard let number = Double(displayLabel.text!) else {
                fatalError("Cannot convert display label text to a Double!")
            }
            return number
        }
        set {
            displayLabel.text = String(newValue)
        }
    }
    
    
    @IBAction func calcButtonPressed(_ sender: UIButton) {
        
        // Reset Finished Typing
        finishedTyping = true
        
        // Set number in Calculator Struct
        calc.setNum(displayValue)
        
        //What should happen when a non-number button is pressed
        if let operation = sender.currentTitle {
            print("Operation is: \(operation)")
            if let result = calc.operationOperations(computation: operation) {
                displayValue = result
            }
            
        }
    }

    
    @IBAction func numButtonPressed(_ sender: UIButton) {
        
        //What should happen when a number is entered into the keypad
        if let numValue = sender.currentTitle {
            print("NumValue Clicked")
            if finishedTyping && numValue == "0" && numValue != "." {
                displayLabel.text = "0"
            } else if finishedTyping {
                displayLabel.text = numValue
                finishedTyping = false
            } else {
                if numValue == "." {
                    
                    let isInt = floor(displayValue) == displayValue
                    
                    if !isInt { return }
                }
                displayLabel.text = displayLabel.text! + numValue
            }
        }
    }
}
