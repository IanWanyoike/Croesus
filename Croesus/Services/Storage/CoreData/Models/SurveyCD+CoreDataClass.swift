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
        surveyCD.store(from: survey)
        return surveyCD
    }

    func store(from survey: SurveyType) {
        self.id = survey.id
        self.title = survey.title
        self.synced = survey.synced ?? false
    }

    func build() -> Survey? {
        guard let id = self.id, let title = self.title else { return nil }
        var survey = Survey(
            id: id,
            title: title,
            synced: self.synced,
            questions: (self.questions ?? []).compactMap {
                ($0 as? QuestionCD)?.build()
            }
        )

        return survey
    }
}
