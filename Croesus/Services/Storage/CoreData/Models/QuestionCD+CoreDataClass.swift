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
        questionCD.id = question.id
        questionCD.title = question.title
        questionCD.label = question.label
        questionCD.type = question.type
        return questionCD
    }
}
