//
//  CoreDataPersonCDPersistor.swift
//  Croesus
//
//  Created by Ian Wanyoike on 02/02/2020.
//  Copyright © 2020 Pocket Pot. All rights reserved.
//

import CoreData

class CoreDataPersonPersistor: CoreDataPersistor {}

extension CoreDataPersonPersistor: PersonPersistor {

    func create<T>(with key: String) -> T? {
        guard let stored: T = self.get(for: key) else {
            let person = PersonCD(context: self.service.context)
            person.id = key
            return person as? T
        }
        return stored
    }

    func save<T>(element: T) {
        guard let person = element as? Person else { return }
        self.service.context.perform {
            guard let personCD: PersonCD = self.create(with: person.id) else { return }
            personCD.store(from: person)
            self.service.saveContext()
        }
    }

    func update<T>(element: T) -> T? {
        PersonCD(context: self.service.context) as? T
    }

    func get<T>(for key: String) -> T? {
        let request: NSFetchRequest<PersonCD> = PersonCD.fetchRequest()
        request.predicate = NSPredicate(format: "id = %@", key as NSString)
        return try? self.service.context.fetch(request).first as? T
    }

    func fetch<T>(from offset: Int, count: Int) -> [T] {
        [PersonCD(context: self.service.context) as? T].compactMap { $0 }
    }

    func delete<T>(for key: String) -> T? {
        PersonCD(context: self.service.context) as? T
    }
}
