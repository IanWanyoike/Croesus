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

    private var question: QuestionType
    let id: String
    let title: BehaviorRelay<String>
    let label: BehaviorRelay<String>
    let type: BehaviorRelay<ControlType?>
    let answer: BehaviorRelay<String?>
    let options: BehaviorRelay<[String]>
    let skipRules: [SkipRule]
    let selectedOptionIndex: BehaviorRelay<Int>
    lazy var disposeBag = DisposeBag()

    init(question: QuestionType, surveyViewModel: SurveyViewModel) {
        self.question = question
        self.id = question.id
        self.title = BehaviorRelay(value: question.title)
        self.label = BehaviorRelay(value: question.label)
        self.type = BehaviorRelay(value: ControlType(rawValue: question.type))
        let options = question.options ?? []
        self.options = BehaviorRelay(value: options)
        self.skipRules = question.skipRules ?? []

        let selectedOptionIndex: Int
        if self.type.value == .some(.radio), let answer = question.answer {
            selectedOptionIndex = options.firstIndex(of: answer) ?? 0
        } else {
            selectedOptionIndex = 0
        }
        self.selectedOptionIndex = BehaviorRelay(value: selectedOptionIndex)

        self.answer = BehaviorRelay(
            value: question.answer ?? (options.isEmpty ? nil : options[selectedOptionIndex])
        )

        self.selectedOptionIndex.bind { [weak self] index in
            guard let `self` = self, index < self.options.value.count else { return }
            self.answer.accept(self.options.value[index])
        }.disposed(by: self.disposeBag)

        self.answer.bind { [weak self] answer in
            guard let `self` = self else { return }
            self.question.answer = answer
            surveyViewModel.questionPersistor
                .save(element: self.question)
                .subscribe().disposed(by: self.disposeBag)

            guard self.type.value == .some(.radio), !self.skipRules.isEmpty else { return }

            var questionsToSkip = surveyViewModel.questionsToSkip.value

            defer { surveyViewModel.questionsToSkip.accept(questionsToSkip) }

            let skipRules = self.skipRules.filter { $0.answer != answer }
            skipRules.forEach { questionsToSkip.subtract($0.skip) }

            guard let skipRule = self.skipRules.first(where: { $0.answer == answer }) else { return }
            questionsToSkip.formUnion(skipRule.skip)
        }.disposed(by: self.disposeBag)
    }
}

extension QuestionViewModel: Hashable {
    static func == (lhs: QuestionViewModel, rhs: QuestionViewModel) -> Bool {
        lhs.id == rhs.id
    }
    func hash(into hasher: inout Hasher) {
        hasher.combine(self.id)
    }
}
