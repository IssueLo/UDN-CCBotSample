//
//  UIView+CornerRadius.swift
//  ccbotPractice3
//
//  Created by 羅翊修 on 2020/1/17.
//  Copyright © 2020 羅翊修. All rights reserved.
//

import UIKit

extension UIView {
    
    func addCornerRadius(corners: CACornerMask, radius: CGFloat) {
        
        self.clipsToBounds = true
        self.layer.cornerRadius = radius
        self.layer.maskedCorners = corners
    }
}
