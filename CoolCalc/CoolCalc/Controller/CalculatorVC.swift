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
    
    // MARK: - Number buttons
    
    @IBAction func numberButtonPressed(_ sender: UIButton) {
        if calculator.operation == .Empty {
                if sender.currentTitle! == "." {
                    if calculator.leftValue.contains(".") {
                        return
                    }
                }
                calculator.leftValue += sender.currentTitle!
                resultLabel.text = calculator.leftValue
        } else {
                if sender.currentTitle! == "." {
                    if calculator.rightValue.contains(".") {
                        return
                    }
                }
                calculator.rightValue += sender.currentTitle!
                resultLabel.text = calculator.rightValue
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
    
    
    
    // MARK: - Special Buttons
    
    @IBAction func posNegBtnPressed(_ sender: Any) {
        calculator.changeSigns()
        format(calculator.result)
    }
    
    @IBAction func percentBtnPressed(_ sender: Any) {
        calculator.changeToPercent()
        format(calculator.result)
    }
    
    @IBAction func clearButtonPressed(_ sender: CustomButton) {
        calculator.clearCalc()
        format(calculator.result)
    }
    
    
    // MARK: - Equal button
    
    @IBAction func equalButtonPressed(_ sender: CustomButton) {
        // makes sure that in order to  do proper math, there has to be two numbers otherwise, equal button does nothing
        if !calculator.hasTwoValues() { return }
        
        // performs underlying logic to calculate the numbers
        calculator.processOperation(operation: calculator.operation)
        
        // formatting based on whether the answer is fractional or whole
        // i.e. If answer is 1, display as 1 and not 1.0 but 2.5 if it is indeed 2.5
        format(calculator.result)
    }
    
    
    
    // MARK: - Utility Functions
    func format(_ number: Double) {
        if number.truncatingRemainder(dividingBy: 1) == 0 {
            resultLabel.text = String(Int(number))
        } else {
            resultLabel.text = String(number)
        }
    }
}

