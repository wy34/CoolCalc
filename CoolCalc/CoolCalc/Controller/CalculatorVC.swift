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
        calculator.processOperation(operation: .Empty)
        resultLabel.text = String(Int(calculator.result))
    }
    
    
    @IBAction func numberButtonPressed(_ sender: UIButton) {
        if calculator.operation == .Empty {
            // check to see if the values are nil so they can be set to their respective string type otherwise leave as nil so that
            // it can be handled by the guard statement below
            if calculator.leftValue == nil {
                calculator.leftValue = ""
                calculator.leftValue! += sender.currentTitle!
                resultLabel.text = calculator.leftValue
            }
        } else {
            if calculator.rightValue == nil {
                calculator.rightValue = ""
                calculator.rightValue! += sender.currentTitle!
                resultLabel.text = calculator.rightValue
            }
        }
    }
    

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
    
    
    @IBAction func equalButtonPressed(_ sender: CustomButton) {
        // makes sure that in order to  do proper math, there has to be two values
        guard let _ = calculator.leftValue, let _ = calculator.rightValue else { return }
        
        calculator.processOperation(operation: calculator.operation)
        calculator.leftValue = String(calculator.result)
        calculator.rightValue = nil
        
        // formatting based on whether the answer is fractional or whole
        // i.e. If answer is 1, display as 1 and not 1.0 but 2.5 if it is indeed 2.5
        if calculator.result.truncatingRemainder(dividingBy: 1) == 0 {
            resultLabel.text = String(Int(calculator.result))
        } else {
            resultLabel.text = String(calculator.result)
        }
    }
}

