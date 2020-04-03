//
//  CustomButton.swift
//  CoolCalc
//
//  Created by William Yeung on 4/2/20.
//  Copyright © 2020 William Yeung. All rights reserved.
//

import UIKit

class CustomButton: UIButton {

   override func awakeFromNib() {
        super.awakeFromNib()
        layer.cornerRadius = 18
        layer.shadowRadius = 5
        layer.shadowOpacity = 0.6
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOffset = .zero
    }
}
