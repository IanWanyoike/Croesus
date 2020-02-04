//
//  AppCoordinator.swift
//  Croesus
//
//  Created by Ian Wanyoike on 01/02/2020.
//  Copyright © 2020 Pocket Pot. All rights reserved.
//

import UIKit
import RxSwift
import os.log

class AppCoordinator: BaseCoordinator<Void> {

    private let window: UIWindow
    private let serviceLocator: ServiceLocator

    init(window: UIWindow, serviceLocator: ServiceLocator) {
        self.window = window
        self.serviceLocator = serviceLocator
    }

    override func start() -> Observable<Void> {
        guard let personPersistor: PersonPersistor = self.serviceLocator.get() else {
            os_log("Person Persistor Type Service Not Registered")
            return Observable.never()
        }
        guard let questionPersistor: QuestionPersistor = self.serviceLocator.get() else {
            os_log("Question Persistor Type Service Not Registered")
            return Observable.never()
        }
        let currentPerson: PersonType? = personPersistor.get(for: Constants.currentUserID)
        switch currentPerson {
        case .none:
            let welcomeCoordinator = WelcomeCoordinator(
                window: self.window,
                personPersistor: personPersistor
            )
            return self.coordinate(to: welcomeCoordinator).flatMap { [weak self] person -> Observable<Void> in
                guard let `self` = self else { return .never() }
                return self.showSurveyList(with: person, persistor: questionPersistor)
            }
        case .some(let person):
            return self.showSurveyList(with: person, persistor: questionPersistor)
        }
    }

    private func showSurveyList(with person: PersonType, persistor: QuestionPersistor) -> Observable<Void> {
        let surveyCoordinator = SurveyListCoordinator(
            window: self.window,
            persistor: persistor,
            person: person
        )
        return self.coordinate(to: surveyCoordinator)
    }
}
