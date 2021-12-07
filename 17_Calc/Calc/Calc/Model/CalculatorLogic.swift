//
//  CalculatorLogic.swift
//  Calc
//
//  Created by Nate Vardell on 12/3/21.
//

import Foundation

struct CalculatorLogic {
    
    private var number: Double?
    private var intermediateCalculation: (n1:Double, operation:String)?
    
    mutating func setNum(_ number: Double) {
        print("Setting Calculator Number = \(number)")
        self.number = number
    }
    
    mutating func operationOperations(computation symbol: String) -> Double? {
        print("Operation is: \(symbol)")
        
        if let n = number {
            switch symbol {
                case "AC":
                    print("\tCase: AC")
                    return 0.0
                case "+/-":
                    print("\tCase: +/-")
                    return n * -1
                case "%":
                    print("\tCase: %")
                    return n * 0.01
                case "=":
                    print("\tCase: =")
                    return performCalculation(n2: n)
                default:
                    print("\tCase: Default")
                    return nil
            }
        } else {
            return nil
        }
    }
    
    mutating private func performCalculation(n2: Double) -> Double? {
        if let n1 = intermediateCalculation?.n1,
            let operation = intermediateCalculation?.operation {
            
            switch operation {
                case "+":
                    print("\t\tCase: +")
                    return n1 + n2
                case "-":
                    print("\t\tCase: -")
                    return n1 - n2
                case "×":
                    print("\t\tCase: ×")
                    return n1 * n2
                case "÷":
                    print("\t\tCase: ÷")
                    return n1 / n2
                default:
                    fatalError("")
            }
        }
        return 0.0
    }
}
