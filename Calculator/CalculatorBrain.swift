//
//  CalculatorBrain.swift
//  Calculator
//
//  Created by Chandler, Sean on 5/11/17.
//  Copyright © 2017 Sean Chandler. All rights reserved.
//

import Foundation

struct CalculatorBrain {
    
    private var accumulator: Double?
    
    private enum Operation {
        case constant(Double)
        case uniaryOperation((Double) -> Double)
        case binaryOperation
    }
    
    private var operations: Dictionary<String, Operation> = [
      "π" : Operation.constant(Double.pi),
      "e" : Operation.constant(M_E),
      "√" : Operation.uniaryOperation(sqrt(<#T##Double#>)),
      "cos" : Operation.uniaryOperation (cos(<#T##Double#>))
    ]
    
    mutating func performOperation(_ symbol: String) {
        if let operation = operations[symbol] {
            switch operation {
            case .constant(<#T##Double#>):
                <#code#>
            case: .uniaryOperation:
            }
        }
    }
    
    mutating func setOperand(_ operand: Double) {
        accumulator = operand
    }
    
    var result: Double? {
        get {
            return accumulator
        }
    }
}
