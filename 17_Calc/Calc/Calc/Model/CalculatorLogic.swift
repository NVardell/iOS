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
    
    mutating func setNum(_ number: Double) {  self.number = number  }
    
    mutating func operationOperations(computation symbol: String) -> Double? {
        
        if let n = number {
            switch symbol {
                case "AC":
                    return 0
                case "+/-":
                    return n * -1
                case "%":
                    return n * 0.01
                case "=":
                    return performCalculation(n2: n)
                default:
                    intermediateCalculation = (n1: n, operation:symbol)
                    return 0
            }
        } else {  return nil  }
    }
    
    mutating private func performCalculation(n2: Double) -> Double? {
        if let n1 = intermediateCalculation?.n1,
            let operation = intermediateCalculation?.operation {
            
            switch operation {
                case "+":
                    return n1 + n2
                case "-":
                    return n1 - n2
                case "×":
                    return n1 * n2
                case "÷":
                    return n1 / n2
                default:
                    fatalError("Unknown operation!")
            }
        } else { return nil }
    }
}
