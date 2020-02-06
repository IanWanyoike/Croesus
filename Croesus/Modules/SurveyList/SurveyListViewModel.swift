//
//  SurveyListViewModel.swift
//  Croesus
//
//  Created by Ian Wanyoike on 02/02/2020.
//  Copyright © 2020 Pocket Pot. All rights reserved.
//

import RxSwift
import RxCocoa
import os.log

struct SurveyListViewModel {

    private let person: PersonType
    let surveys: Observable<[SurveyViewModel]>

    let reload: AnyObserver<Void>

    let selectSurvey: AnyObserver<SurveyViewModel>
    let showSurvey: Observable<SurveyViewModel>

    let disposeBag: DisposeBag

    init(person: PersonType, surveyPersistor: SurveyPersistor, questionPersistor: QuestionPersistor, networkService: NetworkService<SurveyList> = NetworkService()) {
        self.person = person

        let reloadSubject = PublishSubject<Void>()
        self.reload = reloadSubject.asObserver()

        let surveySubject = PublishSubject<SurveyViewModel>()
        self.selectSurvey = surveySubject.asObserver()
        self.showSurvey = surveySubject.asObservable()

        self.disposeBag = DisposeBag()

        // TODO: - Combine These Local Surveys With Fetched Surveys
        let single: Single<[SurveyType]> = surveyPersistor.fetch(parentId: nil)
        single.map { surveys in
            surveys.map {
                SurveyViewModel(
                    survey: $0,
                    questionPersistor: questionPersistor
                )
            }
        }

        self.surveys = reloadSubject.flatMapLatest { _ in
            networkService.request(
                with: .post,
                parameters: ["person_id": person.id]
            )
        }.map { surveyList in
            surveyList.surveys.compactMap {
                surveyPersistor.save(element: $0)
                return SurveyViewModel(
                    survey: $0,
                    questionPersistor: questionPersistor
                )
            }
        }
    }
}
