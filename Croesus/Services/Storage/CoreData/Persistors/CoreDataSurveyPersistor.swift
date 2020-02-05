//
//  CoreDataSurveyPersistor.swift
//  Croesus
//
//  Created by Ian Wanyoike on 06/02/2020.
//  Copyright © 2020 Pocket Pot. All rights reserved.
//

import CoreData

class CoreDataSurveyPersistor: SurveyPersistor {

    // MARK: - State

    let service: CoreDataService

    // MARK: - Initialization

    init(service: CoreDataService) {
        self.service = service
    }

    // MARK: - Persistor Conformance

    func create<T>(with key: String) -> T? {
        guard let stored: T = self.get(for: key) else {
            let survey = SurveyCD(context: self.service.context)
            survey.id = key
            return survey as? T
        }
        return stored
    }

    func save<T>(element: T) {
        guard let survey = element as? Survey else { return }
        self.service.context.perform {
            guard let surveyCD: SurveyCD = self.create(with: survey.id) else { return }
            surveyCD.store(from: survey)
            self.service.saveContext()
        }
    }

    func get<T>(for key: String) -> T? {
        let request: NSFetchRequest<SurveyCD> = SurveyCD.fetchRequest()
        request.predicate = NSPredicate(format: "id = %@", key as NSString)
        return try? self.service.context.fetch(request).first as? T
    }

    func fetch<T>(from offset: Int, count: Int) -> [T] {
        []
    }

    func delete<T>(for key: String) -> T? {
        guard let model: T = self.get(for: key), let cdModel = model as? NSManagedObject else {
            return nil
        }
        self.service.context.delete(cdModel)
        return model
    }
}
