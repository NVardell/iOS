//
//  ResultViewController.swift
//  BMI
//
//  Created by Nate Vardell on 10/21/21.
//  Copyright © 2021 Angela Yu. All rights reserved.
//

import UIKit

class ResultViewController: UIViewController {

    var bmiValue = ""
    
    @IBOutlet weak var bmiLabel: UILabel!
    @IBOutlet weak var adviceLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        bmiLabel.text = bmiValue
    }
    
    @IBAction func recalcPressed(_ sender: UIButton) {
        self.performSegue(withIdentifier: "goToCalculate", sender: self)
    }
    
}
