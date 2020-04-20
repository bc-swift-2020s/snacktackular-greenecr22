//
//  UIView+addBorder.swift
//  Snacktacular
//
//  Created by Christopher Greene on 4/20/20.
//  Copyright © 2020 Christopher Greene. All rights reserved.
//

import Foundation
import UIKit

extension UIView {
    func addBorder(width: CGFloat, radius: CGFloat, color: UIColor) {
        self.layer.borderWidth = width
        self.layer.borderColor = color.cgColor
        self.layer.cornerRadius = radius
    }
    
    func noBorder() {
        self.layer.borderWidth = 0.0
    }
}
