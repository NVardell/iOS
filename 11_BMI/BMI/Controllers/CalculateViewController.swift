//
//  ViewController.swift
//  BMI Calculator
//
//  Created by Nate V. on 10/20/2021.
//  Copyright © 2019 Angela Yu. All rights reserved.
//

import UIKit

class CalculateViewController: UIViewController {

    var calc = Calculator()
    
    @IBOutlet weak var bmiLabel: UILabel!
    @IBOutlet weak var heightLabel: UILabel!
    @IBOutlet weak var weightLabel: UILabel!
    @IBOutlet weak var heightSlider: UISlider!
    @IBOutlet weak var weightSlider: UISlider!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func heightSliderChanged(_ sender: UISlider) {
        heightLabel.text = String(format: "%.2fm", sender.value)
    }
    
    
    @IBAction func weightSliderChanged(_ sender: UISlider) {
        weightLabel.text = "\(Int(sender.value))Kg"
    }
    
    
    @IBAction func calcButtonPressed(_ sender: UIButton) {
        let height = heightSlider.value
        let weight = weightSlider.value

        // Calculate BMI & Display Result View
        calc.calculateBMI(height: height, weight: weight)
        performSegue(withIdentifier: "goToResult", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToResult" {
            let destinationVC = segue.destination as! ResultViewController
            destinationVC.bmiValue = calc.getBMIValue()
            destinationVC.advice = calc.getAdvice()
            destinationVC.color = calc.getColor()
        }
    }
}

