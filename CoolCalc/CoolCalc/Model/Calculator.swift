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
        }
    }
}
