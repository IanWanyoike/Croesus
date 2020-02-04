//
//  NameViewModel.swift
//  Croesus
//
//  Created by Ian Wanyoike on 02/02/2020.
//  Copyright © 2020 Pocket Pot. All rights reserved.
//

import RxSwift
import RxCocoa

class NameViewModel {

    private var person: PersonType

    let firstName: BehaviorRelay<String?>
    let lastName: BehaviorRelay<String?>

    let disposeBag = DisposeBag()

    init(person: PersonType) {
        self.person = person

        self.firstName = BehaviorRelay(value: person.firstName)
        self.lastName = BehaviorRelay(value: person.lastName)

        Disposables.create([
            self.firstName.bind { [weak self] in
                self?.person.firstName = $0
            },
            self.lastName.bind { [weak self] in
                self?.person.lastName = $0
            }
        ]).disposed(by: self.disposeBag)
    }
}
