//
//  CalculatorBrain.swift
//  Calculator
//
//  Created by Chandler, Sean on 5/11/17.
//  Copyright © 2017 Sean Chandler. All rights reserved.
//

import Foundation

func changeSign(operand: Double) -> Double {
    return -operand
}

struct CalculatorBrain {
    
    private var accumulator: Double?
    
    private enum Operation {
        case constant(Double)
        case uniaryOperation((Double) -> Double)
        case binaryOperation((Double, Double) -> Double)
        case equals
    }
    
    private var operations: Dictionary<String, Operation> = [
      "π" : Operation.constant(Double.pi),
      "e" : Operation.constant(M_E),
      "√" : Operation.uniaryOperation(sqrt),
      "cos" : Operation.uniaryOperation (cos),
      "+/-" : Operation.uniaryOperation( { -$0 } ),
      "×" : Operation.binaryOperation( { $0 * $1 } ),
      "÷" : Operation.binaryOperation( { $0 / $1 } ),
      "+" : Operation.binaryOperation( { $0 + $1 } ),
      "−" : Operation.binaryOperation( { $0 -  $1 } ),
      "=" : Operation.equals
    ]
    
    mutating func performOperation(_ symbol: String) {
        if let operation = operations[symbol] {
            switch operation {
            case .constant(let value):
                accumulator = value
            case .uniaryOperation(let function):
                if accumulator != nil {
                   accumulator = function(accumulator!)
                }
            case .binaryOperation(let function):
                if accumulator != nil {
                    pendingBinaryOperation = PendingBinaryOperation(function: function, firstOperand: accumulator!)
                    accumulator = nil
                }
            case .equals:
                performPendingBinaryOperation()
            }
            
        }
    }
    
    private mutating func performPendingBinaryOperation() {
        if pendingBinaryOperation != nil && accumulator != nil {
            accumulator = pendingBinaryOperation!.perform(with: accumulator!)
            pendingBinaryOperation = nil
        }
        
        
    }
    
    private var pendingBinaryOperation: PendingBinaryOperation?
    
    private struct PendingBinaryOperation {
        let function: (Double, Double) -> Double
        let firstOperand: Double
        
        func perform(with secondOperand: Double) -> Double {
            return function(firstOperand, secondOperand)
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
