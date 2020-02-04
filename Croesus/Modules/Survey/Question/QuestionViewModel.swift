//
//  QuestionViewModel.swift
//  Croesus
//
//  Created by Ian Wanyoike on 03/02/2020.
//  Copyright © 2020 Pocket Pot. All rights reserved.
//

import RxSwift
import RxCocoa

enum ControlType: String {
    case radio
    case checkbox
    case text
}

class QuestionViewModel {

    let title: BehaviorRelay<String>
    let label: BehaviorRelay<String>
    let type: BehaviorRelay<ControlType?>
    let answer: BehaviorRelay<String?>
    let options: BehaviorRelay<[String]>

    init(question: Question) {
        self.title = BehaviorRelay(value: question.title)
        self.label = BehaviorRelay(value: question.label)
        self.type = BehaviorRelay(value: ControlType(rawValue: question.type))
        self.options = BehaviorRelay(value: question.options ?? [])
        self.answer = BehaviorRelay(value: nil)
    }
}
