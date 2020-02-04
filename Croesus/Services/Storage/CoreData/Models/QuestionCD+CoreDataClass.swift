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
    }
}
