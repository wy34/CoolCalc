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
    var rightValue = ""
    var leftValue = ""
    var operation = ""
    var result = 0.0
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func clearButtonPressed(_ sender: CustomButton) {
        operation = ""
        rightValue = ""
        leftValue = ""
        result = 0.0
        resultLabel.text = ""
    }
    
    @IBAction func numberButtonPressed(_ sender: UIButton) {
        if operation == "" {
            leftValue += sender.currentTitle!
            resultLabel.text = leftValue
        } else {
            rightValue += sender.currentTitle!
            resultLabel.text = rightValue
        }
    }
    
    @IBAction func operationButtonPressed(_ sender: CustomButton) {
        operation = sender.currentTitle!
        resultLabel.text = operation
    }
    
    @IBAction func equalButtonPressed(_ sender: CustomButton) {
        if operation == "+" {
            result = Double(leftValue)! + Double(rightValue)!
        } else if operation == "-" {
            result = Double(leftValue)! - Double(rightValue)!
        } else if operation == "x" {
            result = Double(leftValue)! * Double(rightValue)!
        } else if operation == "/" {
            result = Double(leftValue)! / Double(rightValue)!
        }
        leftValue = String(result)
        rightValue = ""
        resultLabel.text = String(result)
    }
    
}
