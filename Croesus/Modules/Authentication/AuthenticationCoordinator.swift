//
//  AuthenticationCoordinator.swift
//  Croesus
//
//  Created by Ian Wanyoike on 02/02/2020.
//  Copyright © 2020 Pocket Pot. All rights reserved.
//

import UIKit
import RxSwift

enum AuthenticationCoordinatorResult {
    case person(PersonType)
    case cancel
}

class AuthenticationCoordinator: BaseCoordinator<AuthenticationCoordinatorResult> {

    let navigationController: UINavigationController
    let personPersistor: PersonPersistor

    init(navigationController: UINavigationController, personPersistor: PersonPersistor) {
        self.navigationController = navigationController
        self.personPersistor = personPersistor
    }

    override func start() -> Observable<CoordinationResult> {
        let currentPerson: PersonType = Person(id: Constants.currentUserID, idNumber: 0)
        let viewModel = PagesViewModel<PersonType>(model: currentPerson)
        let controller = PagesController<PersonType>(viewModel: viewModel)
        controller.viewModel.setControllers(
            self.createControllers(
                with: controller,
                person: currentPerson
            )
        )

        let cancel = viewModel.didCancel.map { _ in CoordinationResult.cancel }
        let person = viewModel.didComplete.map { CoordinationResult.person($0) }

        self.navigationController.pushViewController(controller, animated: true)

        return Observable.merge(cancel, person)
            .take(1)
            .do(onNext: { [weak self] result in
                switch result {
                case .person(let person):
                    self?.personPersistor.save(element: person)
                case .cancel:
                    break
                }
                self?.navigationController.popViewController(animated: true)
            })
    }

    private func createControllers(with delegate: FlowDelegate, person: PersonType) -> [FlowTriggerType] {
        var controllers: [FlowTriggerType] = []

        let nameViewModel = NameViewModel(person: person)
        let nameController = NameController(viewModel: nameViewModel)
        nameController.delegate = delegate

        controllers.append(nameController)

        let identifierViewModel = IdentifierViewModel(person: person)
        let identifierController = IdentifierController(viewModel: identifierViewModel)
        identifierController.delegate = delegate

        controllers.append(identifierController)

        let avatarViewModel = AvatarViewModel(person: person)
        let avatarController = AvatarController(viewModel: avatarViewModel)
        avatarController.delegate = delegate

        controllers.append(avatarController)

        return controllers
    }
}
