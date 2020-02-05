//
//  ServiceLocator.swift
//  Croesus
//
//  Created by Ian Wanyoike on 02/02/2020.
//  Copyright © 2020 Pocket Pot. All rights reserved.
//

import Foundation
import RxSwift

enum ServiceLocatorError: Error {
    case notRegistered
}

protocol ServiceLocatorType {

    func add<T>(_ authenticator: T)
    func get<T>() -> T?
}
class ServiceLocator {

    // MARK: - State
    private var services: [String: Any] = [:]

    // MARK: - Initializer
    init() {}
}
extension ServiceLocator: ServiceLocatorType {

    func add<T>(_ service: T) {
        let serviceKey = "\(type(of: service))"
        services[serviceKey] = service
    }

    func get<T>() -> T? {
        let serviceKey = String(describing: T.self)
        return services[serviceKey] as? T
    }
}
extension ServiceLocator {
    func registerCoreDataServices() {
        let coreDataService = CoreDataService()
        self.add(coreDataService)
        let personPersistor: PersonPersistor = CoreDataPersonPersistor(service: coreDataService)
        self.add(personPersistor)
        let questionPersistor: QuestionPersistor = CoreDataQuestionPersistor(service: coreDataService)
        self.add(questionPersistor)
    }
}
