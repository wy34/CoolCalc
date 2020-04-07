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
            // adds each number pressed onto a string to allow multi digit numbers
            calculator.leftValue += checkNumberPressed(for: sender, ofValue: calculator.leftValue)
            //display(format(Double(calculator.leftValue)!)) // fix decimal as first input
            display(calculator.leftValue)
        } else {
            calculator.rightValue += checkNumberPressed(for: sender, ofValue: calculator.rightValue)
            //display(format(Double(calculator.rightValue)!))
            display(calculator.rightValue)
        }
    }
    
    // MARK: - Operation Buttons
    
    @IBAction func divideBtnPressed(_ sender: Any) {
        calculator.operation = .Divide
        display("/")
    }
    @IBAction func mulitplyBtnPressed(_ sender: Any) {
        calculator.operation = .Multiply
        display("x")
    }
    @IBAction func subtractBtnPressed(_ sender: Any) {
        calculator.operation = .Subtract
        display("-")
    }
    @IBAction func addBtnPressed(_ sender: Any) {
        calculator.operation = .Add
        display("+")
    }
    
    
    
    // MARK: - Special Buttons
    
    @IBAction func posNegBtnPressed(_ sender: Any) {
        calculator.changeSigns()
        display(format(calculator.result))
    }
    
    @IBAction func percentBtnPressed(_ sender: Any) {
        calculator.changeToPercent()
        display(format(calculator.result))
    }
    
    @IBAction func clearButtonPressed(_ sender: CustomButton) {
        calculator.clearCalc()
        display(format(calculator.result))
    }
    
    
    // MARK: - Equal button
    
    @IBAction func equalButtonPressed(_ sender: CustomButton) {
        // makes sure that in order to  do proper math, there has to be two numbers otherwise, equal button does nothing
        if !calculator.hasTwoValues() { return }
        
        // performs underlying logic to calculate the numbers
        calculator.processOperation(operation: calculator.operation)
        
        // formatting based on whether the answer is fractional or whole
        // i.e. If answer is 1, display as 1 and not 1.0 but 2.5 if it is indeed 2.5
        display(format(calculator.result))
    }
    
    
    
    // MARK: - Miscellaneous Functions
    
//    func format(_ number: Double) -> String {
//        // formatting based on whether the answer is fractional or whole
//        // i.e. If answer is 1, display as 1 and not 1.0 but 2.5 if it is indeed 2.5
//        let decimalNumber = number.truncatingRemainder(dividingBy: 1) == 0 ? String(Int(number)) : String(number)
//        let wholeNumber = number.truncatingRemainder(dividingBy: 1) == 0 ? String(Int(number)) : String(String(number)[..<String(number).firstIndex(of: ".")!])
//
//
//        // adds comma delimitor if number is greater than 3 whole digits
//        if wholeNumber.count > 3 {
//            // split the number into an array of strings
//            let numberArrayAsCharacters = Array(wholeNumber)
//            var numberArrayAsStrings = numberArrayAsCharacters.map {String($0)}
//            var counter = 0
//
//            // going in reverse, insert a comma after every third number
//            for i in stride(from: numberArrayAsStrings.count - 1, to: 0, by: -1) {
//                counter += 1
//                if counter == 3 {
//                    numberArrayAsStrings.insert(",", at: i)
//                    counter = 0
//                }
//            }
//            // convert the array back into a string and return the newly formatted number
//            let result = number.truncatingRemainder(dividingBy: 1) == 0 ? "" : String(number)[String(number).firstIndex(of: ".")!...]
//            return numberArrayAsStrings.joined(separator: "") + result
//        } else {
//            // if there is no need to add commas (count was 3 or less)
//            return String(decimalNumber)
//        }
//    }
//
    
    func format(_ number: Double) -> String {
        // formatting based on whether the answer is fractional or whole
        // i.e. If answer is 1, display as 1 and not 1.0 but 2.5 if it is indeed 2.5
        return number.truncatingRemainder(dividingBy: 1) == 0 ? String(Int(number)) : String(number)
    }
    
    
    
    // displays the button value presses, operations, and  result
    func display(_ text: String) {
        resultLabel.text = text
    }
    
    
    
    func checkNumberPressed(for button: UIButton, ofValue: String) -> String {
        // apparently based off of the apple calculator on my iphone, the max integer allowed is 16 so thats what I tried to attempt here as well
        if ofValue.count < 16 {
            // makes sure that a decimal can only be entered once per number, if not a decmial, return the button value
            if button.currentTitle! == "." &&  ofValue.contains(".") {
                return ""
            }
            return button.currentTitle!
        }
        return ""
    }
}

