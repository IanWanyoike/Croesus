//
//  CoreDataQuestionPersistor.swift
//  Croesus
//
//  Created by Ian Wanyoike on 02/02/2020.
//  Copyright © 2020 Pocket Pot. All rights reserved.
//

import CoreData
import RxSwift

class CoreDataQuestionPersistor: QuestionPersistor {

    // MARK: - State
    
    let service: CoreDataService

    // MARK: - Initialization

    init(service: CoreDataService) {
        self.service = service
    }

    // MARK: - Persistor Conformance

    func create<T>(with key: String) -> T? {
        guard let stored: T = self.get(for: key) else {
            let question = QuestionCD(context: self.service.context)
            question.id = key
            return question as? T
        }
        return stored
    }

    func save<T>(element: T) {
        guard let question = element as? Question else { return }
        self.service.context.perform {
            guard let questionCD: QuestionCD = self.create(with: question.id) else { return }
            questionCD.store(from: question)
            self.service.saveContext()
        }
    }

    func get<T>(for key: String) -> T? {
        let request: NSFetchRequest<QuestionCD> = QuestionCD.fetchRequest()
        request.predicate = NSPredicate(format: "id = %@", key as NSString)
        return try? self.service.context.fetch(request).first as? T
    }

    func fetch<T>(from offset: Int, count: Int) -> Single<[T]> {
        Single<[T]>.create { single in
            let disposables = Disposables.create()
            let request: NSFetchRequest<QuestionCD> = QuestionCD.fetchRequest()
            guard let all = try? self.service.context.fetch(request) else { single(.error(PersistorError.persistableNotFound))
                return disposables
            }
            single(.success((all.compactMap { $0.build() } as? [T]) ?? []))
            return disposables
        }
    }

    func delete<T>(for key: String) -> T? {
        guard let model: T = self.get(for: key), let cdModel = model as? NSManagedObject else {
            return nil
        }
        self.service.context.delete(cdModel)
        return model
    }
}
