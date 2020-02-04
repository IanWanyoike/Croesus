//
//  SurveyCoordinator.swift
//  Croesus
//
//  Created by Ian Wanyoike on 02/02/2020.
//  Copyright © 2020 Pocket Pot. All rights reserved.
//

import RxSwift

enum SurveyCoordinatorResult {
    case save(SurveyType)
    case cancel
}

class SurveyCoordinator: BaseCoordinator<SurveyCoordinatorResult> {

    let navigationController: UINavigationController
    let surveyViewModel: SurveyViewModel

    init(navigationController: UINavigationController, surveyViewModel: SurveyViewModel) {
        self.navigationController = navigationController
        self.surveyViewModel = surveyViewModel
    }

    override func start() -> Observable<CoordinationResult> {
        let surveyController = SurveyController(viewModel: self.surveyViewModel)

        let cancel = self.surveyViewModel.didCancel.map { CoordinationResult.cancel }
        let save = self.surveyViewModel.didSave.map { _ in CoordinationResult.save(self.surveyViewModel.survey) }

        self.navigationController.pushViewController(surveyController, animated: true)

        return Observable.merge(cancel, save)
            .take(1)
            .do(onNext: { [weak self] _ in self?.navigationController.popViewController(animated: true) })
    }
}
