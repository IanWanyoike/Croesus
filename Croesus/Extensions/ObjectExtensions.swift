//
//  ObjectExtensions.swift
//  Croesus
//
//  Created by Ian Wanyoike on 07/02/2020.
//  Copyright © 2020 Pocket Pot. All rights reserved.
//

import Foundation

extension Encodable {
    func asDictionary() throws -> [String: Any] {
        let data = try JSONEncoder().encode(self)
        let anyData = try JSONSerialization.jsonObject(with: data, options: .allowFragments)
        guard let dictionary = anyData as? [String: Any] else { throw NSError() }
        return dictionary
    }
}
