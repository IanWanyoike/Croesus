//
//  QuestionList.swift
//  Croesus
//
//  Created by Ian Wanyoike on 05/02/2020.
//  Copyright © 2020 Pocket Pot. All rights reserved.
//

import Foundation

struct QuestionList: NetworkModelType {

    static var baseUrl = SurveyList.baseUrl

    var questions: [Question] = []
}
