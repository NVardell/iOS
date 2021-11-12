//
//  ViewController.swift
//  Tipsy
//
//  Created by Angela Yu on 09/09/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class CalculatorViewController: UIViewController {

    var tip = 0.10
    var people = 2
    var billTotal = 0.0
    var finalTotal = "0.0"
    
    @IBOutlet weak var splitNumberLabel: UILabel!
    @IBOutlet weak var billTextField: UITextField!
    
    @IBOutlet weak var zeroPctButton: UIButton!
    @IBOutlet weak var tenPctButton: UIButton!
    @IBOutlet weak var twentyPctButton: UIButton!
    
    @IBAction func tipChanged(_ sender: UIButton) {
        updateSelected()
        billTextField.endEditing(true)
        sender.isSelected = true
        
        let buttonTitle = sender.currentTitle!
        let buttonTitleValue = String(buttonTitle.dropLast())
        let buttonTitleValueAsNum = Double(buttonTitleValue)!
        tip = buttonTitleValueAsNum / 100
    }
    
    @IBAction func stepperValueChanged(_ sender: UIStepper) {
        splitNumberLabel.text = String(format: "%.0f", sender.value)
        people = Int(sender.value)
    }
    
    @IBAction func calculatePressed(_ sender: UIButton) {
        let bill = billTextField.text!
        print("Bill Total = \(bill)")
        
        if bill != "" {
            billTotal = Double(bill)!
            let result = billTotal * (1+tip) / Double(people)
            finalTotal = String(format: "%.2f", result)
            print("Final Total = \(finalTotal)")
        }
        
        self.performSegue(withIdentifier: "goToResults", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToResults" {
            let destinationVC = segue.destination as! ResultsViewController
            destinationVC.result = finalTotal
            destinationVC.tip = Int(tip*100)
            destinationVC.split = people
        }
    }
    
    func updateSelected() {
        print("Tip Percent Changed.")
        zeroPctButton.isSelected = false
        tenPctButton.isSelected = false
        twentyPctButton.isSelected = false
    }
}

