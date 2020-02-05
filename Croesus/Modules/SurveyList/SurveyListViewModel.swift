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

    init(person: PersonType, networkService: NetworkService<SurveyList> = NetworkService()) {
        self.person = person

        let reloadSubject = PublishSubject<Void>()
        self.reload = reloadSubject.asObserver()

        let surveySubject = PublishSubject<SurveyViewModel>()
        self.selectSurvey = surveySubject.asObserver()
        self.showSurvey = surveySubject.asObservable()

        self.disposeBag = DisposeBag()

        self.surveys = reloadSubject.flatMapLatest { _ in
            networkService.request(
                with: .post,
                parameters: ["person_id": person.id]
            )
        }.map { surveyList in surveyList.surveys.compactMap { SurveyViewModel(survey: $0) } }
    }
}
