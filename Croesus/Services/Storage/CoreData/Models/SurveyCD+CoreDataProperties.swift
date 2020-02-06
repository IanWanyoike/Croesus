//
//  SurveyCD+CoreDataProperties.swift
//  Croesus
//
//  Created by Ian Wanyoike on 06/02/2020.
//  Copyright © 2020 Pocket Pot. All rights reserved.
//
//

import Foundation
import CoreData


extension SurveyCD {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<SurveyCD> {
        return NSFetchRequest<SurveyCD>(entityName: "SurveyCD")
    }

    @NSManaged public var id: String?
    @NSManaged public var synced: Bool
    @NSManaged public var title: String?
    @NSManaged public var questions: NSSet?

}

// MARK: Generated accessors for questions
extension SurveyCD {

    @objc(addQuestionsObject:)
    @NSManaged public func addToQuestions(_ value: QuestionCD)

    @objc(removeQuestionsObject:)
    @NSManaged public func removeFromQuestions(_ value: QuestionCD)

    @objc(addQuestions:)
    @NSManaged public func addToQuestions(_ values: NSSet)

    @objc(removeQuestions:)
    @NSManaged public func removeFromQuestions(_ values: NSSet)

}
