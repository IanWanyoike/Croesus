//
//  CollectionExtensions.swift
//  Croesus
//
//  Created by Ian Wanyoike on 03/02/2020.
//  Copyright © 2020 Pocket Pot. All rights reserved.
//

import Foundation

extension Optional where Wrapped: Collection {
    func nilOrEmpty() -> Bool {
        guard let value = self else { return true }
        return value.isEmpty
    }
}
