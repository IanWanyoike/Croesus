//
//  SurveyList.swift
//  Croesus
//
//  Created by Ian Wanyoike on 03/02/2020.
//  Copyright © 2020 Pocket Pot. All rights reserved.
//

import Foundation

struct SurveyList: NetworkModelType {

    static var baseUrl = Constants.baseURL.appendingPathComponent("surveys")

    let surveys: [Survey]
}
