//
//  QuestionType.swift
//  Croesus
//
//  Created by Ian Wanyoike on 03/02/2020.
//  Copyright © 2020 Pocket Pot. All rights reserved.
//

import Foundation

protocol QuestionType {

    var parentId: String? { get set }
    var id: String { get set }
    var title: String { get set }
    var label: String { get set }
    var type: String { get set }
    var options: [String]? { get set }
    var skipRules: [SkipRule]? { get set }
    var answer: String? { get set }
}
