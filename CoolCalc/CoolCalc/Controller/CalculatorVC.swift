//
//  CalculatorVC.swift
//  CoolCalc
//
//  Created by William Yeung on 4/2/20.
//  Copyright © 2020 William Yeung. All rights reserved.
//

import UIKit

class CalculatorVC: UIViewController {
    
    @IBOutlet weak var resultLabel: UILabel!

    var calculator: Calculator!
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        calculator = Calculator()
    }
    
    
    @IBAction func clearButtonPressed(_ sender: CustomButton) {
        calculator.processOperation(operation: .Clear)
        resultLabel.text = String(Int(calculator.result))
    }
    
    
    // MARK: - Number buttons
    
    // This is due to an edge case where if a user is missing a second value(left or right), the optional type allows it to be caught by a handler bc it would be nil,
    // but at the same time needs to also be able to turn into string so that multi digit numbers are possible versus only single digit at a time
    // Therefore, the following checks to see if the values are nil(default), if it is change it to a string so that multi digit numbers are possible
    @IBAction func numberButtonPressed(_ sender: UIButton) {
        if calculator.operation == .Clear {
            if calculator.leftValue == nil {
                calculator.leftValue = ""
            }
            
            if calculator.leftValue != nil {
                calculator.leftValue! += sender.currentTitle!
                resultLabel.text = calculator.leftValue
            }
        } else {
            if calculator.rightValue == nil {
                calculator.rightValue = ""
            }
            
            if calculator.rightValue != nil {
                calculator.rightValue! += sender.currentTitle!
                resultLabel.text = calculator.rightValue
            }
        }
    }
    

    // MARK: - Operation Buttons
    
    @IBAction func divideBtnPressed(_ sender: Any) {
        calculator.operation = .Divide
        resultLabel.text = "/"
    }
    @IBAction func mulitplyBtnPressed(_ sender: Any) {
        calculator.operation = .Multiply
        resultLabel.text = "x"
    }
    @IBAction func subtractBtnPressed(_ sender: Any) {
        calculator.operation = .Subtract
        resultLabel.text = "-"
    }
    @IBAction func addBtnPressed(_ sender: Any) {
        calculator.operation = .Add
        resultLabel.text = "+"
    }
    
    @IBAction func posNegBtnPressed(_ sender: Any) {
        
    }
    
    @IBAction func percentBtnPressed(_ sender: Any) {
        calculator.changeToPercent()
        resultLabel.text = String(calculator.result)
    }
    
    // MARK: - Equal button
    
    @IBAction func equalButtonPressed(_ sender: CustomButton) {
        // makes sure that in order to  do proper math, there has to be two values otherwise, equal button does nothing
        if !calculator.hasTwoValues() { return }
        
        // performs underlying logic to calculate the numbers
        calculator.processOperation(operation: calculator.operation)
        
        // formatting based on whether the answer is fractional or whole
        // i.e. If answer is 1, display as 1 and not 1.0 but 2.5 if it is indeed 2.5
        if calculator.result.truncatingRemainder(dividingBy: 1) == 0 {
            resultLabel.text = String(Int(calculator.result))
        } else {
            resultLabel.text = String(calculator.result)
        }
    }
}

