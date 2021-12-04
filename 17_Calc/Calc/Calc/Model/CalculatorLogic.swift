//
//  CalculatorLogic.swift
//  Calc
//
//  Created by Nate Vardell on 12/3/21.
//

import Foundation

struct CalculatorLogic {
    
    var number: Double
    init(number: Double) {
        self.number = number
    }
    
    func operationOperations(computation operation: String) -> Double {
            print("Operation is: \(operation)")
            switch operation {
                case "AC":
                    print("\tCase: AC")
                    return 0.0
                case "+/-":
                    print("\tCase: +/-")
                    return number * -1
                case "%":
                    print("\tCase: %")
                    return number * 0.01
                case "÷":
                    print("\tCase: ÷")
                    return number
                case "×":
                    print("\tCase: ×")
                    return number
                case "-":
                    print("\tCase: -")
                    return number
                case "+":
                    print("\tCase: +")
                    return number
                case "=":
                    print("\tCase: =")
                    return number
                default:
                    print("\tCase: Default")
                    return 0.0
            }
    }
}
