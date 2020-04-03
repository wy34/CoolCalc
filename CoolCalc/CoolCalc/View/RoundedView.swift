//
//  RoundedView.swift
//  CoolCalc
//
//  Created by William Yeung on 4/2/20.
//  Copyright © 2020 William Yeung. All rights reserved.
//

import UIKit

class RoundedView: UIView {

    override func awakeFromNib() {
        super.awakeFromNib()
        layer.borderWidth = 5
        layer.cornerRadius = 10
        layer.borderColor = #colorLiteral(red: 0.1257418692, green: 0.1250017583, blue: 0.1263155639, alpha: 1)
        clipsToBounds = true
    }

}
