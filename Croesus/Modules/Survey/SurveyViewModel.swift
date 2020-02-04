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

    let survey: SurveyType

    let title: BehaviorRelay<String>
    let questions: BehaviorRelay<[QuestionViewModel]>

    let cancel: AnyObserver<Void>
    let didCancel: Observable<Void>

    let save: AnyObserver<SurveyType>
    let didSave: Observable<SurveyType>

    init(survey: SurveyType) {
        self.survey = survey

        self.title = BehaviorRelay(value: survey.title)
        self.questions = BehaviorRelay(value: survey.questions.compactMap {
            QuestionViewModel(question: $0)
        })

        let cancelSubject = PublishSubject<Void>()
        self.cancel = cancelSubject.asObserver()
        self.didCancel = cancelSubject.asObservable()

        let saveSubject = PublishSubject<SurveyType>()
        self.save = saveSubject.asObserver()
        self.didSave = saveSubject.asObservable()
    }

    func onSave() {
        self.save.onNext(self.survey)
    }
}
