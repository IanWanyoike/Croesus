//
//  CoreDataPersonCDPersistor.swift
//  Croesus
//
//  Created by Ian Wanyoike on 02/02/2020.
//  Copyright © 2020 Pocket Pot. All rights reserved.
//

import CoreData
import RxSwift

class CoreDataPersonPersistor: PersonPersistor {

    // MARK: - State

    let service: CoreDataService

    // MARK: - Initialization

    init(service: CoreDataService) {
        self.service = service
    }

    // MARK: - Persistor Conformance

    func create<T>(with key: String) -> T? {
        guard let stored: T = self.get(for: key) else {
            let person = PersonCD(context: self.service.context)
            person.id = key
            return person as? T
        }
        return stored
    }

    @discardableResult
    func save<T>(element: T) -> Completable {
        guard let person = element as? PersonType else {
            return Completable.error(PersistorError.invalidType)
        }
        return Completable.create { completable in
            self.service.context.perform {
                guard let personCD: PersonCD = self.create(with: person.id) else {
                    completable(.error(PersistorError.createFailed))
                    return
                }
                personCD.store(from: person)
                self.service.saveContext()
                completable(.completed)
            }
            return Disposables.create()
        }
    }

    func get<T>(for key: String) -> T? {
        let request: NSFetchRequest<PersonCD> = PersonCD.fetchRequest()
        request.predicate = NSPredicate(format: "id = %@", key as NSString)
        return try? self.service.context.fetch(request).first as? T
    }

    func fetch<T>(parentId: String?) -> Single<[T]> {
        Single.just([])
    }

    func delete<T>(for key: String) -> T? {
        guard let model: T = self.get(for: key), let cdModel = model as? NSManagedObject else {
            return nil
        }
        self.service.context.delete(cdModel)
        return model
    }
}
