//
//  PersistorMocks.swift
//  CroesusTests
//
//  Created by Ian Wanyoike on 10/02/2020.
//  Copyright © 2020 Pocket Pot. All rights reserved.
//

import Foundation

@testable import Croesus

import RxSwift

struct Persist {
    var id: String?
}

class PersistorMock: SurveyPersistor, QuestionPersistor {

    // MARK: - State
    var store: [String: Any]

    // MARK: - Initialization
    init(store: [String: Any] = [:]) {
        self.store = store
    }

    // MARK: - Persistor Conformance
    func create<T>(with key: String) -> T? {
        guard let stored: T = self.get(for: key) else {
            var t: T?
            if T.self == Survey.self {
                t = Survey(id: key, title: "Test Survey", synced: false, questions: []) as? T
            } else if T.self == Question.self {
                t = Question(
                    parentId: nil,
                    id: key,
                    title: "Test Question",
                    label: "Question Label",
                    type: "text",
                    skipRules: nil,
                    options: nil,
                    answer: nil
                ) as? T
            }
            return t
        }
        return stored
    }

    @discardableResult
    func save<T>(element: T) -> Completable {
        var identifier: String?
        if let surveyType = element as? SurveyType {
            identifier = surveyType.id
        } else if let questionType = element as? QuestionType {
            identifier = questionType.id
        }
        guard let id = identifier else {
            return Completable.error(PersistorError.invalidType)
        }
        guard let created: T = self.create(with: id) else {
            return Completable.error(PersistorError.createFailed)
        }
        self.store[id] = created
        return Completable.empty()
    }

    func get<T>(for key: String) -> T? {
        self.store[key] as? T
    }

    func fetch<T>(parentId: String?) -> Single<[T]> {
        Single.just(self.store.compactMap { $1 as? T })
    }

    func delete<T>(for key: String) -> T? {
        return self.store.removeValue(forKey: key) as? T
    }
}
