//
//  PersonType.swift
//  Croesus
//
//  Created by Ian Wanyoike on 01/02/2020.
//  Copyright © 2020 Pocket Pot. All rights reserved.
//

import CoreData
import RxSwift

protocol PersonType {

    var id: String { get set }
    var firstName: String? { get set }
    var lastName: String? { get set }
    var idNumber: Int16 { get set }
    var avatar: Data? { get set }
}
