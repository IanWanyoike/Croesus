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
    private var allQuestions: Set<QuestionViewModel> = Set()

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

        self.allQuestions = Set()
    }

    func loadQuestions() -> Completable {
        return self.networkService.request(
            from: SurveyList.baseUrl.appendingPathComponent("\(self.survey.id)/questions")
        ).catchErrorJustReturn(QuestionList())
        .map { [weak self] list -> Completable in
            guard let `self` = self else { return .never() }
            guard !list.questions.isEmpty else { return .empty() }
            let questionsToSave = list.questions.map { question -> Completable in
                var question = question
                question.parentId = self.survey.id
                return self.questionPersistor.save(element: question)
            }
            return Completable.concat(questionsToSave)
        }.flatMapCompletable { [weak self] saveCompletable -> Completable in
            guard let `self` = self else { return .never() }
            let single: Single<[QuestionType]> = self.questionPersistor.fetch(parentId: self.survey.id)
            return saveCompletable.andThen(single.map { surveys in
                surveys.map { QuestionViewModel(question: $0, surveyViewModel: self) }
            }.map {
                self.allQuestions.formUnion($0)
                self.questionsToSkip.accept(self.questionsToSkip.value)
            }.asCompletable())
        }
    }

    func setupBinding() {
        self.questionsToSkip.flatMap { [weak self] shouldSkip -> Observable<[QuestionViewModel]> in
            guard let `self` = self else { return .never() }
            return Observable.from(optional: Array(self.allQuestions.filter { !shouldSkip.contains($0.id) }))
        }
        .map { $0.sorted(by: { $0.id < $1.id }) }
        .bind(to: self.questions)
        .disposed(by: self.disposeBag)
    }

    func sync() -> Completable {
        let list: Single<[Question]> = self.questionPersistor.fetch(parentId: self.survey.id)
        return list.flatMapCompletable { questions -> Completable in
            guard let parameters = try? QuestionList(questions: questions).asDictionary() else { return .empty() }
            return self.networkService.request(with: .post, parameters: parameters).asCompletable()
        }
    }

    func onCancel() {
        self.cancel.onNext(())
    }

    func onSave() {
        self.save.onNext(self.survey)
    }
}
