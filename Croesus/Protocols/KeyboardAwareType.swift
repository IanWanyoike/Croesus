//
//  KeyboardAware.swift
//  Croesus
//
//  Created by Ian Wanyoike on 01/02/2020.
//  Copyright © 2020 Pocket Pot Limited. All rights reserved.
//

import UIKit

@objc protocol KeyboardAwareType where Self: UIViewController {
    var keyboardType: UIKeyboardType { get set }
    var keyboardAwareConstraint: NSLayoutConstraint? { get set }
    @objc func keyboardNotification(notification: NSNotification)
}
extension KeyboardAwareType where Self: UIViewController {
    func switchKeyboardAware(to on: Bool) {
        switch on {
        case true:
            NotificationCenter.default.addObserver(
                self,
                selector: #selector(self.keyboardNotification(notification:)),
                name: UIResponder.keyboardWillChangeFrameNotification,
                object: nil
            )
        case false:
            NotificationCenter.default.removeObserver(
                self,
                name: UIResponder.keyboardWillChangeFrameNotification,
                object: nil
            )
        }
    }
    func keyboardAware(notification: NSNotification) {
        guard let userInfo = notification.userInfo else { return }
        let endFrame = (userInfo[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue
        let duration: TimeInterval = (userInfo[UIResponder.keyboardAnimationDurationUserInfoKey] as? NSNumber)?.doubleValue ?? 0
        let animationCurveRawNSN = userInfo[UIResponder.keyboardAnimationCurveUserInfoKey] as? NSNumber
        let animationCurveRaw = animationCurveRawNSN?.uintValue ?? UIView.AnimationOptions.curveEaseInOut.rawValue
        let animationCurve = UIView.AnimationOptions(rawValue: animationCurveRaw)
        if let frame = endFrame, frame.origin.y >= UIScreen.main.bounds.size.height {
            self.keyboardAwareConstraint?.constant = 0.0
        } else {
            self.keyboardAwareConstraint?.constant = endFrame?.size.height ?? 0.0
        }
        self.view.layoutIfNeeded()
        UIView.animate(
            withDuration: duration,
            delay: TimeInterval(0),
            options: animationCurve,
            animations: { self.view.layoutIfNeeded() },
            completion: nil
        )
    }
}
