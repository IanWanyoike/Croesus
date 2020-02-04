//
//  QuestionCD+CoreDataProperties.swift
//  Croesus
//
//  Created by Ian Wanyoike on 03/02/2020.
//  Copyright © 2020 Pocket Pot. All rights reserved.
//
//

import Foundation
import CoreData


extension QuestionCD {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<QuestionCD> {
        return NSFetchRequest<QuestionCD>(entityName: "QuestionCD")
    }

    @NSManaged public var id: String?
    @NSManaged public var title: String?
    @NSManaged public var label: String?
    @NSManaged public var type: String?
    @NSManaged public var answer: String?
    @NSManaged public var survey: SurveyCD?

}
