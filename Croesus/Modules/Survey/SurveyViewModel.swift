//
//  SurveyViewModel.swift
//  Croesus
//
//  Created by Ian Wanyoike on 02/02/2020.
//  Copyright © 2020 Pocket Pot. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa

class SurveyViewModel {

    private let survey: SurveyType

    let title: BehaviorRelay<String>

    let cancel: AnyObserver<Void>
    let didCancel: Observable<Void>

    let save: AnyObserver<SurveyType>
    let didSave: Observable<SurveyType>

    let questionsToSkip: BehaviorRelay<Set<String>>
    private var allQuestions: [QuestionViewModel] = []
    let questions: BehaviorRelay<[QuestionViewModel]>

    lazy var disposeBag = DisposeBag()

    init(survey: SurveyType) {
        self.survey = survey

        self.title = BehaviorRelay(value: survey.title)

        let cancelSubject = PublishSubject<Void>()
        self.cancel = cancelSubject.asObserver()
        self.didCancel = cancelSubject.asObservable()

        let saveSubject = PublishSubject<SurveyType>()
        self.save = saveSubject.asObserver()
        self.didSave = saveSubject.asObservable()

        self.questionsToSkip = BehaviorRelay(value: Set())
        self.questions = BehaviorRelay(value: [])
        self.allQuestions = survey.questions.map {
            QuestionViewModel(question: $0, surveyViewModel: self)
        }
        self.questionsToSkip.flatMap { [weak self] shouldSkip -> Observable<[QuestionViewModel]> in
            guard let `self` = self else { return .empty() }
            return Observable.from(optional: self.allQuestions.filter { !shouldSkip.contains($0.id) })
        }
        .bind(to: self.questions)
        .disposed(by: self.disposeBag)
    }

    func onCancel() {
        self.cancel.onNext(())
    }

    func onSave() {
        self.save.onNext(self.survey)
    }
}
