//
//  BorderLabel.swift
//  CoolCalc
//
//  Created by William Yeung on 4/2/20.
//  Copyright © 2020 William Yeung. All rights reserved.
//

import UIKit

class BorderLabel: UILabel {

    override func awakeFromNib() {
        super.awakeFromNib()
        layer.borderWidth = 5
        layer.borderColor = #colorLiteral(red: 0.1106112227, green: 0.109961234, blue: 0.1111157164, alpha: 1)
        layer.cornerRadius = 10
        clipsToBounds = true
    }

}
