//
//  SurveyListCoordinator.swift
//  Croesus
//
//  Created by Ian Wanyoike on 02/02/2020.
//  Copyright © 2020 Pocket Pot. All rights reserved.
//

import UIKit
import RxSwift

class SurveyListCoordinator: BaseCoordinator<Void> {

    let window: UIWindow
    let persistor: QuestionPersistor
    let person: PersonType

    init(window: UIWindow, persistor: QuestionPersistor, person: PersonType) {
        self.window = window
        self.persistor = persistor
        self.person = person
    }

    override func start() -> Observable<Void> {
        let surveyListViewModel = SurveyListViewModel(person: self.person)
        let surveyListController = SurveyListController(viewModel: surveyListViewModel)
        let navigationController = UINavigationController(rootViewController: surveyListController)

        surveyListViewModel.showSurvey.flatMap { [weak self] viewModel -> Observable<SurveyCoordinatorResult> in
            guard let `self` = self else { return .empty() }
            return self.coordinate(to: SurveyCoordinator(navigationController: navigationController, surveyViewModel: viewModel))
        }.subscribe().disposed(by: self.disposeBag)

        self.window.rootViewController = navigationController
        self.window.makeKeyAndVisible()

        return .never()
    }

    private func showSurvey(in navigationController: UINavigationController, with viewModel: SurveyViewModel) -> Observable<SurveyCoordinatorResult> {
        return self.coordinate(
            to: SurveyCoordinator(
                navigationController: navigationController,
                surveyViewModel: viewModel
            )
        ).do(onNext: { [weak self] result in
            switch result {
            case .save(let survey):
                self?.persistor.save(element: survey)
            default:
                break
            }
        })
    }
}
