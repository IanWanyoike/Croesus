//
//  WelcomeCoordinator.swift
//  Croesus
//
//  Created by Ian Wanyoike on 02/02/2020.
//  Copyright © 2020 Pocket Pot. All rights reserved.
//

import RxSwift

class WelcomeCoordinator: BaseCoordinator<PersonType> {

    let window: UIWindow
    let personPersistor: PersonPersistor

    init(window: UIWindow, personPersistor: PersonPersistor) {
        self.window = window
        self.personPersistor = personPersistor
    }

    override func start() -> Observable<PersonType> {
        let welcomeViewModel = WelcomeViewModel()
        let welcomeController = WelcomeController(viewModel: welcomeViewModel)

        let navigationController = UINavigationController(rootViewController: welcomeController)

        welcomeViewModel.didRequestAuthentication.flatMap { [weak self] _ -> Observable<PersonType?> in
            guard let `self` = self else { return .empty() }
            return self.authenticate(in: navigationController)
        }
        .compactMap { $0 }
        .bind(to: welcomeViewModel.storePerson)
        .disposed(by: self.disposeBag)

        self.window.rootViewController = navigationController
        self.window.makeKeyAndVisible()

        return welcomeViewModel.didStorePerson
    }

    private func authenticate(in navigationController: UINavigationController) -> Observable<PersonType?> {
        let coordinator = AuthenticationCoordinator(
            navigationController: navigationController,
            personPersistor: self.personPersistor
        )
        return self.coordinate(to: coordinator).map { result in
            switch result {
            case .person(let person):
                return person
            case .cancel:
                return nil
            }
        }
    }
}
