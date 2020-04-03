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
    var resultString = ""
    
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func clearButtonPressed(_ sender: CustomButton) {
        resultString = ""
        resultLabel.text = ""
    }
    
    @IBAction func numberButtonPressed(_ sender: UIButton) {
        resultString += sender.currentTitle!
        resultLabel.text = resultString
    }
    
    @IBAction func operationButtonPressed(_ sender: CustomButton) {
        
    }
    
}
