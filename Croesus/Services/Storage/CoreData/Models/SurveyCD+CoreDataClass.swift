//
//  SurveyCD+CoreDataClass.swift
//  Croesus
//
//  Created by Ian Wanyoike on 03/02/2020.
//  Copyright © 2020 Pocket Pot. All rights reserved.
//
//

import Foundation
import CoreData

@objc(SurveyCD)
public class SurveyCD: NSManagedObject {

    static func build(from survey: SurveyType, with context: NSManagedObjectContext) -> SurveyCD {
        let surveyCD = SurveyCD(context: context)
        surveyCD.id = survey.id
        surveyCD.title = survey.title
        return surveyCD
    }
}
