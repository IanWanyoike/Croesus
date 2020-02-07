//
//  SurveyListCoordinator.swift
//  Croesus
//
//  Created by Ian Wanyoike on 02/02/2020.
//  Copyright © 2020 Pocket Pot. All rights reserved.
//

import UIKit
import RxSwift
import os.log

class SurveyListCoordinator: BaseCoordinator<Void> {

    let window: UIWindow
    let surveyPersistor: SurveyPersistor
    let questionPersistor: QuestionPersistor
    let person: PersonType

    init(window: UIWindow, surveyPersistor: SurveyPersistor, questionPersistor: QuestionPersistor, person: PersonType) {
        self.window = window
        self.surveyPersistor = surveyPersistor
        self.questionPersistor = questionPersistor
        self.person = person
    }

    override func start() -> Observable<Void> {
        let surveyListViewModel = SurveyListViewModel(
            person: self.person,
            surveyPersistor: self.surveyPersistor,
            questionPersistor: self.questionPersistor
        )
        let surveyListController = SurveyListController(viewModel: surveyListViewModel)
        let navigationController = UINavigationController(rootViewController: surveyListController)

        self.window.rootViewController = navigationController
        self.window.makeKeyAndVisible()

        surveyListViewModel.showSurvey.flatMap { [weak self] viewModel -> Observable<SurveyCoordinatorResult> in
            guard let `self` = self else { return .empty() }
            return self.showSurvey(in: navigationController, with: viewModel)
        }.subscribe().disposed(by: self.disposeBag)
        
        return .never()
    }

    private func showSurvey(in navigationController: UINavigationController, with viewModel: SurveyViewModel) -> Observable<SurveyCoordinatorResult> {
        return self.coordinate(
            to: SurveyCoordinator(
                navigationController: navigationController,
                surveyViewModel: viewModel
            )
        ).do(onNext: { [weak self] result in
            guard let `self` = self else { return }
            switch result {
            case .save(let survey):
                self.surveyPersistor.save(element: survey)
                    .andThen(viewModel.sync())
                    .catchError { error in
                        os_log("Sync Error (Because of unavailable endpoint): %@", error.localizedDescription)
                        return .empty()
                    }
                    .subscribe()
                    .disposed(by: self.disposeBag)
            default:
                break
            }
        })
    }
}
