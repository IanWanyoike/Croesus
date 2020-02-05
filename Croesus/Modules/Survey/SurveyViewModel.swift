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
    let questionPersistor: QuestionPersistor
    let networkService: NetworkService<QuestionList>

    let title: BehaviorRelay<String>

    let cancel: AnyObserver<Void>
    let didCancel: Observable<Void>

    let save: AnyObserver<SurveyType>
    let didSave: Observable<SurveyType>

    let questionsToSkip: BehaviorRelay<Set<String>>
    private var allQuestions: [QuestionViewModel] = [] {
        didSet { self.allQuestions.sort(by: { $0.id < $1.id }) }
    }
    let questions: BehaviorRelay<[QuestionViewModel]>

    lazy var disposeBag = DisposeBag()

    init(survey: SurveyType, questionPersistor: QuestionPersistor, networkService: NetworkService<QuestionList> = NetworkService()) {
        self.survey = survey
        self.questionPersistor = questionPersistor
        self.networkService = networkService

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
            questionPersistor.save(element: $0)
            return QuestionViewModel(question: $0, surveyViewModel: self)
        }
        self.questionsToSkip.flatMap { [weak self] shouldSkip -> Observable<[QuestionViewModel]> in
            guard let `self` = self else { return .empty() }
            return Observable.from(optional: self.allQuestions.filter { !shouldSkip.contains($0.id) })
        }
        .bind(to: self.questions)
        .disposed(by: self.disposeBag)
    }

    func loadQuestions() -> Completable {
        self.networkService.request(
            from: SurveyList.baseUrl.appendingPathComponent("\(self.survey.id)/questions")
        ).map { [weak self] in
            guard let `self` = self else { return }
            let list: [QuestionViewModel] = $0.questions.compactMap { question in
                guard !self.allQuestions.contains(where: { $0.id == question.id }) else { return nil }
                self.questionPersistor.save(element: question)
                return QuestionViewModel(question: question, surveyViewModel: self)
            }
            self.allQuestions.append(contentsOf: list)
            self.questions.accept(self.allQuestions.filter { !self.questionsToSkip.value.contains($0.id) })
        }.asCompletable()
    }

    func onCancel() {
        self.cancel.onNext(())
    }

    func onSave() {
        self.save.onNext(self.survey)
    }
}
