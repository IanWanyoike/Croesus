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
    private let networkService: NetworkService<SurveyList>
    let surveys: BehaviorRelay<[SurveyViewModel]>

    let selectSurvey: AnyObserver<SurveyViewModel>
    let showSurvey: Observable<SurveyViewModel>

    let disposeBag: DisposeBag

    init(person: PersonType, networkService: NetworkService<SurveyList> = NetworkService()) {
        self.person = person
        self.networkService = networkService
        self.surveys = BehaviorRelay(value: [])

        let surveySubject = PublishSubject<SurveyViewModel>()
        self.selectSurvey = surveySubject.asObserver()
        self.showSurvey = surveySubject.asObservable()

        self.disposeBag = DisposeBag()
    }

    func load() -> Completable {
        Completable.create { completable in
            let disposable = self.networkService.request(
                with: .post,
                parameters: ["person_id": self.person.id]
            ).subscribe { event in
                switch event { 
                case .success(let surveyList):
                    self.surveys.accept(surveyList.surveys.compactMap { SurveyViewModel(survey: $0) })
                    completable(.completed)
                case .error(let error):
                    os_log("Fetch Survey List Error: %@", error.localizedDescription)
                    completable(.error(error))
                }
            }
            return Disposables.create([disposable])
        }
    }
}
