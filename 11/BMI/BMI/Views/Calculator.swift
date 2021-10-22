//
//  Calculator.swift
//  BMI
//
//  Created by Nate Vardell on 10/22/21.
//  Copyright © 2021 Angela Yu. All rights reserved.
//

import Foundation

struct Calculator {
    
    var bmiValue = ""
    
    func getBMIValue() -> String {
        return bmiValue
    }
    
    mutating func calculateBMI(height: Float, weight: Float) {
        let bmi = weight / (height*height)
        bmiValue = String(format: "%.1f", bmi)
    }
}
