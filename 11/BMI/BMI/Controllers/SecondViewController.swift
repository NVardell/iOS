//
//  SecondViewController.swift
//  BMI
//
//  Created by Nate Vardell on 10/21/21.
//  Copyright © 2021 Angela Yu. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {

    var bmiValue = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .red // Red so we can easily see where it's at.
        
        // Programatically creating a UI Label
        let label = UILabel()
        label.text = "BAM!"
        // Label - Programatically setting size/position
        label.frame = CGRect(x: 0, y: 0, width: 100, height: 50)
        view.addSubview(label)
    }
}
