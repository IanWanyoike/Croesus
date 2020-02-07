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

    @discardableResult
    func save<T>(element: T) -> Completable {
        guard let question = element as? QuestionType else {
            return .error(PersistorError.invalidType)
        }
        return Completable.create { completable in
            self.service.context.perform {
                guard let questionCD: QuestionCD = self.create(with: question.id) else {
                    completable(.error(PersistorError.createFailed))
                    return
                }
                questionCD.store(from: question)
                self.service.saveContext()
                completable(.completed)
            }
            return Disposables.create()
        }
    }

    func get<T>(for key: String) -> T? {
        let request: NSFetchRequest<QuestionCD> = QuestionCD.fetchRequest()
        request.predicate = NSPredicate(format: "id = %@", key as NSString)
        return try? self.service.context.fetch(request).first as? T
    }

    func fetch<T>(parentId: String?) -> Single<[T]> {
        Single<[T]>.create { single in
            let disposables = Disposables.create()
            let request: NSFetchRequest<QuestionCD> = QuestionCD.fetchRequest()
            parentId.map {
                request.predicate = NSPredicate(format: "parentId = %@", $0 as NSString)
            }
            guard let all = try? self.service.context.fetch(request) else { single(.error(PersistorError.notFound))
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
