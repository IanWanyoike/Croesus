//
//  PagesViewModel.swift
//  Croesus
//
//  Created by Ian Wanyoike on 01/02/2020.
//  Copyright © 2020 Pocket Pot Limited. All rights reserved.
//

import UIKit
import RxSwift

class PagesViewModel<T> {

    // MARK: - State
    private let model: T
    private(set) var controllers: [FlowTriggerType]

    let cancel: AnyObserver<Void>
    let didCancel: Observable<Void>

    let complete: AnyObserver<T>
    let didComplete: Observable<T>

    init(model: T) {
        self.model = model
        self.controllers = []

        let cancelSubject = PublishSubject<Void>()
        self.cancel = cancelSubject.asObserver()
        self.didCancel = cancelSubject.asObservable()

        let completeSubject = PublishSubject<T>()
        self.complete = completeSubject.asObserver()
        self.didComplete = completeSubject.asObservable()
    }

    func setControllers(_ controllers: [FlowTriggerType]) {
        self.controllers = controllers
    }

    func onComplete() {
        self.complete.onNext(self.model)
    }
}
