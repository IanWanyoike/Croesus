//
//  ViewExtensions.swift
//  Croesus
//
//  Created by Ian Wanyoike on 02/02/2020.
//  Copyright © 2020 Pocket Pot. All rights reserved.
//

import UIKit

extension UIView {

    @discardableResult
    func setBorder(radius: CGFloat, width: CGFloat, color: UIColor = .clear) -> UIView {
        let roundView: UIView = self
        roundView.layer.cornerRadius = CGFloat(radius)
        roundView.layer.borderWidth = width
        roundView.layer.borderColor = color.cgColor
        roundView.clipsToBounds = true
        return roundView
    }

    @IBInspectable var roundedCorner: CGFloat {
        get { return self.layer.cornerRadius }
        set {
            self.layer.cornerRadius = newValue
            self.layer.masksToBounds = newValue > 0
        }
    }

    internal var shakeKey: String { return "ShakeAnimation" }

    func shake() {
        self.layer.removeAnimation(forKey: self.shakeKey)
        let vals: [Double] = [-2, 2, -2, 2, 0]

        let translation = CAKeyframeAnimation(keyPath: "transform.translation.x")
        translation.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.linear)
        translation.values = vals

        let rotation = CAKeyframeAnimation(keyPath: "transform.rotation.z")
        rotation.values = vals.map { (degrees: Double) in
            let radians: Double = (Double.pi * degrees) / 180.0
            return radians
        }

        let shakeGroup: CAAnimationGroup = CAAnimationGroup()
        shakeGroup.animations = [translation, rotation]
        shakeGroup.duration = 0.3
        self.layer.add(shakeGroup, forKey: self.shakeKey)
    }
}
