//
//  Survey.swift
//  Croesus
//
//  Created by Ian Wanyoike on 03/02/2020.
//  Copyright © 2020 Pocket Pot. All rights reserved.
//

import Foundation

struct Survey: SurveyType, NetworkModelType {

    static var baseUrl = Constants.baseURL.appendingPathComponent("surveys")

    var id: String
    var title: String
    var questions: [Question]

}
