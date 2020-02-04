//
//  SurveyCD+CoreDataProperties.swift
//  Croesus
//
//  Created by Ian Wanyoike on 03/02/2020.
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
    @NSManaged public var status: Int16
    @NSManaged public var questions: QuestionCD?

}
