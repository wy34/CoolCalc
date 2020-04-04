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
        case .Empty:
            self.operation = .Empty
            self.rightValue = nil
            self.leftValue = nil
            self.result = 0.0
            return
        }
        
        // assign the answer to results variable so it can be reference by the actual results on screen
        self.leftValue = String(self.result)
        // reset to nil so that it can be checked optionally checked otherwise we can't
        self.rightValue = nil
    }
    
    
    // checks to make sure that there are two values
    func hasTwoValues() -> Bool {
        guard let _ = self.leftValue, let _ = self.rightValue else { return false }
        return true
    }
}
