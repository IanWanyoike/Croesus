//
//  PersistorType.swift
//  Croesus
//
//  Created by Ian Wanyoike on 01/02/2020.
//  Copyright © 2020 Pocket Pot. All rights reserved.
//

import RxSwift

enum PersistorError: Error {
    case invalidType
    case persistableNotFound
}

protocol Persistable: Codable {
    var id: String? { get set }
}

protocol PersistorType {
    func create<T>(with key: String) -> T?
    func save<T>(element: T)
    func get<T>(for key: String) -> T?
    func fetch<T>(from offset: Int, count: Int) -> [T]
    func delete<T>(for key: String) -> T?
}
