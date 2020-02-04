//
//  SurveyType.swift
//  Croesus
//
//  Created by Ian Wanyoike on 03/02/2020.
//  Copyright © 2020 Pocket Pot. All rights reserved.
//

import Foundation

protocol SurveyType {

    var id: String { get set }
    var title: String { get set }
    var questions: [Question] { get set }
}
