//
//  Constants.swift
//  Croesus
//
//  Created by Ian Wanyoike on 01/02/2020.
//  Copyright © 2020 Pocket Pot. All rights reserved.
//

import Foundation
import UIKit

struct Constants {
    static let baseURL: URL = {
        guard let url = URL(string: "https://api.croesus.com") else {
            fatalError("Couldn't build Croesus API endpoint")
        }
        return url
    }()
    static let currentUserID = UIDevice.current.identifierForVendor?.uuidString ?? UUID().uuidString
    static let bundleName: String = {
        guard let name = Bundle.main.infoDictionary?[kCFBundleNameKey as String] as? String else {
            fatalError("Bundle name is not set in Info.plist")
        }
        return name
    }()
}

func delay(_ delay: Double, closure: @escaping () -> Void) {
    DispatchQueue.main.asyncAfter(
        deadline: DispatchTime.now() + Double(Int64(delay * Double(NSEC_PER_SEC))) / Double(NSEC_PER_SEC),
        execute: closure
    )
}
