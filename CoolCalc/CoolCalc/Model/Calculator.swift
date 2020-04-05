//
//  Calculator.swift
//  CoolCalc
//
//  Created by William Yeung on 4/2/20.
//  Copyright © 2020 William Yeung. All rights reserved.
//

import Foundation

struct Calculator {
    var rightValue: String?
    var leftValue: String?
    var operation: Operation = .Empty
    var result = 0.0
    
    
    
   
    mutating func processOperation(operation: Operation) {
        switch operation {
        case .Add:
            self.result = Double(self.leftValue!)! + Double(self.rightValue!)!
        case .Subtract:
            self.result = Double(self.leftValue!)! - Double(self.rightValue!)!
        case .Multiply:
            self.result = Double(self.leftValue!)! * Double(self.rightValue!)!
        case .Divide:
            self.result = Double(self.leftValue!)! / Double(self.rightValue!)!
        case .PosNeg:
            print("PosNeg")
        case .Empty:
            return
        }
        
        // sets the result to the left value so that further calculations can be performed
        // further numbers will always be considered the "2nd number" so therefore stored in right value
        self.leftValue = String(self.result)
        // reset to nil so that further calculation can be performed and can be checked optionally checked
        self.rightValue = nil
    }
    
    
    // checks to make sure that there are two values
    func hasTwoValues() -> Bool {
        guard let _ = self.leftValue, let _ = self.rightValue else { return false }
        return true
    }
    
    
    mutating func clearCalc() {
        self.operation = .Empty
        self.rightValue = nil
        self.leftValue = nil
        self.result = 0.0
    }
    
    
    mutating func changeToPercent() {
        // do nothing if both values are empty
        if self.leftValue == nil && self.rightValue == nil { return }
        
        if self.rightValue == nil {
            self.leftValue = String(Double(self.leftValue!)! / Double(100))
            self.result = Double(self.leftValue!)!
        } else if self.leftValue == nil || self.operation != .Empty {
            self.rightValue = String(Double(self.rightValue!)! / Double(100))
            self.result = Double(self.rightValue!)!
        }
    }
}
