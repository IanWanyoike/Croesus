//
//  ViewControllerExtensions.swift
//  Croesus
//
//  Created by Ian Wanyoike on 02/02/2020.
//  Copyright © 2020 Pocket Pot. All rights reserved.
//

import UIKit

enum Position {
    case left, right
}

extension UIViewController {
    func addNavButton(to navigationItem: UINavigationItem, position: Position, selector: Selector, tintColor: UIColor, image: UIImage?) {
        let button = UIButton(type: .custom)
        button.setImage(image?.withRenderingMode(.alwaysTemplate), for: .normal)
        button.tintColor = tintColor
        button.addTarget(self, action: selector, for: .touchUpInside)
        button.frame = CGRect(x: 0, y: 0, width: 36, height: 36)
        button.imageEdgeInsets = UIEdgeInsets(top: 9, left: 9, bottom: 9, right: 9)

        let barButton = UIBarButtonItem(customView: button)
        switch position {
        case .left:
            navigationItem.leftBarButtonItem = barButton
        case .right:
            navigationItem.rightBarButtonItem = barButton
        }
    }
}
