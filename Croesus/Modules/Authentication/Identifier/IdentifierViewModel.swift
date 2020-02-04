//
//  IdentifierViewModel.swift
//  Croesus
//
//  Created by Ian Wanyoike on 02/02/2020.
//  Copyright © 2020 Pocket Pot. All rights reserved.
//

import RxSwift
import RxCocoa

class IdentifierViewModel {

    private var person: PersonType
    let identifier: BehaviorRelay<String?>
    let disposeBag = DisposeBag()

    init(person: PersonType) {
        self.person = person
        self.identifier = BehaviorRelay(value: String(person.idNumber))
        self.identifier
            .compactMap { $0 }
            .map { Int16($0) }
            .compactMap { $0 }
            .bind { [weak self] in
                self?.person.idNumber = $0
            }.disposed(by: self.disposeBag)
    }
}
