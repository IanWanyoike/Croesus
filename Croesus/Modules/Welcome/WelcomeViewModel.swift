//
//  WelcomeViewModel.swift
//  Croesus
//
//  Created by Ian Wanyoike on 02/02/2020.
//  Copyright © 2020 Pocket Pot. All rights reserved.
//

import RxSwift

struct WelcomeViewModel {

    let storePerson: AnyObserver<PersonType>
    let didStorePerson: Observable<PersonType>

    let authenticate: AnyObserver<Void>
    let didRequestAuthentication: Observable<Void>

    init() {
        let personSubject = PublishSubject<PersonType>()
        self.storePerson = personSubject.asObserver()
        self.didStorePerson = personSubject.asObservable()

        let authenticateSubject = PublishSubject<Void>()
        self.authenticate = authenticateSubject.asObserver()
        self.didRequestAuthentication = authenticateSubject.asObservable()
    }
}
