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
    case text
}

class QuestionViewModel {

    private let question: Question
    let id: String
    let title: BehaviorRelay<String>
    let label: BehaviorRelay<String>
    let type: BehaviorRelay<ControlType?>
    let answer: BehaviorRelay<String?>
    let options: BehaviorRelay<[String]>
    let skipRules: [SkipRule]
    let selectedOptionIndex: BehaviorRelay<Int>
    lazy var disposeBag = DisposeBag()

    init(question: Question, surveyViewModel: SurveyViewModel) {
        self.question = question
        self.id = question.id
        self.title = BehaviorRelay(value: question.title)
        self.label = BehaviorRelay(value: question.label)
        self.type = BehaviorRelay(value: ControlType(rawValue: question.type))
        self.options = BehaviorRelay(value: question.options ?? [])
        self.answer = BehaviorRelay(value: self.options.value.isEmpty ? nil : self.options.value[0])
        self.skipRules = question.skipRules ?? []
        self.selectedOptionIndex = BehaviorRelay(value: 0)
        self.selectedOptionIndex.bind { [weak self] index in
            guard let `self` = self, index < self.options.value.count else { return }
            self.answer.accept(self.options.value[index])
        }.disposed(by: self.disposeBag)
        guard self.type.value == .some(.radio) else { return }
        self.answer.bind { [weak self] answer in
            var questionsToSkip = surveyViewModel.questionsToSkip.value
            defer { surveyViewModel.questionsToSkip.accept(questionsToSkip) }
            guard let `self` = self else { return }
            let skipRules = self.skipRules.filter { $0.answer != answer }
            skipRules.forEach { questionsToSkip.subtract($0.skip) }
            guard let skipRule = self.skipRules.first(where: { $0.answer == answer }) else { return }
            questionsToSkip.formUnion(skipRule.skip)
        }.disposed(by: self.disposeBag)
    }
}
