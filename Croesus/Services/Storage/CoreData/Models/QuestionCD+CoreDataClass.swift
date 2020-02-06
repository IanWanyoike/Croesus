//
//  QuestionCD+CoreDataClass.swift
//  Croesus
//
//  Created by Ian Wanyoike on 03/02/2020.
//  Copyright © 2020 Pocket Pot. All rights reserved.
//
//

import Foundation
import CoreData

@objc(QuestionCD)
public class QuestionCD: NSManagedObject {

    static func build(from question: QuestionType, with context: NSManagedObjectContext) -> QuestionCD {
        let questionCD = QuestionCD(context: context)
        questionCD.store(from: question)
        return questionCD
    }

    func store(from question: QuestionType) {
        self.id = question.id
        self.title = question.title
        self.label = question.label
        self.type = question.type
        self.answer = question.answer
        self.options = question.options
        self.skipRules = question.skipRules?.compactMap {
            try? JSONEncoder().encode($0)
        }
    }

    func build() -> Question? {
        guard let id = self.id, let title = self.title,
            let label = self.label, let type = self.type else {
            return nil
        }
        var question = Question(id: id, title: title, label: label, type: type)
        question.answer = self.answer
        question.options = self.options
        question.skipRules = self.skipRules?.compactMap {
            try? JSONDecoder().decode(SkipRule.self, from: $0)
        }
        return question
    }
}
