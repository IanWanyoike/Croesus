//
//  AvatarViewModel.swift
//  Croesus
//
//  Created by Ian Wanyoike on 02/02/2020.
//  Copyright © 2020 Pocket Pot. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class AvatarViewModel {

    var person: PersonType
    let avatar: BehaviorRelay<UIImage?>
    let disposeBag = DisposeBag()

    init(person: PersonType) {
        self.person = person
        self.avatar = BehaviorRelay(value: UIImage(data: person.avatar ?? Data()))
        self.avatar.bind { [weak self] in
            self?.person.avatar = $0?.pngData()
        }.disposed(by: self.disposeBag)
    }
}
