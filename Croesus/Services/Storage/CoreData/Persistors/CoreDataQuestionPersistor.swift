//
//  CoreDataQuestionPersistor.swift
//  Croesus
//
//  Created by Ian Wanyoike on 02/02/2020.
//  Copyright © 2020 Pocket Pot. All rights reserved.
//

import CoreData

class CoreDataQuestionPersistor: CoreDataPersistor {}

extension CoreDataQuestionPersistor: QuestionPersistor {

    func create<T>(with key: String) -> T? {
        QuestionCD(context: self.service.context) as? T
    }

    func save<T>(element: T) {
        self.service.saveContext()
    }

    func update<T>(element: T) -> T? {
        QuestionCD(context: self.service.context) as? T
    }

    func get<T>(for key: String) -> T? {
        QuestionCD(context: self.service.context) as? T
    }

    func fetch<T>(from offset: Int, count: Int) -> [T] {
        [QuestionCD(context: self.service.context) as? T].compactMap { $0 }
    }

    func delete<T>(for key: String) -> T? {
        QuestionCD(context: self.service.context) as? T
    }
}
