//
//  Question.swift
//  Croesus
//
//  Created by Ian Wanyoike on 03/02/2020.
//  Copyright © 2020 Pocket Pot. All rights reserved.
//

import Foundation

struct Question: QuestionType, NetworkModelType {

    static var baseUrl = Constants.baseURL.appendingPathComponent("surveys")

    var id: String
    var title: String
    var label: String
    var type: String
    var options: [String]?

}
