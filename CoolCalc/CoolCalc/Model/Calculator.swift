//
//  Calculator.swift
//  CoolCalc
//
//  Created by William Yeung on 4/2/20.
//  Copyright © 2020 William Yeung. All rights reserved.
//

import Foundation

struct Calculator {
    var rightValue = ""
    var leftValue = ""
    var operation: Operation = .Empty
    var result = 0.0
    
    
    
   // perform calculation based on which operation was pressed
    mutating func processOperation(operation: Operation) {
        switch operation {
        case .Add:
            self.result = Double(self.leftValue)! + Double(self.rightValue)!
        case .Subtract:
            self.result = Double(self.leftValue)! - Double(self.rightValue)!
        case .Multiply:
            self.result = Double(self.leftValue)! * Double(self.rightValue)!
        case .Divide:
            self.result = Double(self.leftValue)! / Double(self.rightValue)!
        case .Empty:
            return
        }
        
        // sets the result to the left value so that further calculations can be performed
        // further numbers will always be considered the "2nd number" so therefore stored in right value
        self.leftValue = String(self.result)
        // reset to empty so that further calculation can be performed
        self.rightValue = ""
        // reset the operation after one was just completed
        self.operation = .Empty
    }
    
    
    // checks to make sure that there are two numbers
    func hasTwoValues() -> Bool {
        guard let _ = Double(self.leftValue), let _ = Double(self.rightValue) else { return false }
        return true
    }
    
    
    // resets the calculator
    mutating func clearCalc() {
        self.operation = .Empty
        self.rightValue = ""
        self.leftValue = ""
        self.result = 0.0
    }
    

    // change the current value to its percentage form
    mutating func changeToPercent() {
        // do nothing if both values are empty
        if self.leftValue == "" && self.rightValue == "" { return }
        
        // checks which value to turn into percentage and when it is allowed
        if self.rightValue == "" {
            self.leftValue = String(Double(self.leftValue)! / Double(100))
            self.result = Double(self.leftValue)!
        } else if self.leftValue == "" || self.operation != .Empty {
            self.rightValue = String(Double(self.rightValue)! / Double(100))
            self.result = Double(self.rightValue)!
        }
    }
    
    
    // change the sign of teh current value
    mutating func changeSigns() {
        // do nothing if both values are empty
        if self.leftValue == "" && self.rightValue == "" { return }
        
        if self.operation == .Empty {
            self.leftValue = String(-Double(self.leftValue)!)
            self.result = Double(self.leftValue)!
        } else if self.leftValue == "" || self.operation != .Empty {
            if self.rightValue == "" {
                self.result = 0.0
                return
            }
            self.rightValue = String(-Double(self.rightValue)!)
            self.result = Double(self.rightValue)!
        }
    }
    
    
}
