//
//  SurveyListViewModelTests.swift
//  CroesusTests
//
//  Created by Ian Wanyoike on 04/02/2020.
//  Copyright © 2020 Pocket Pot. All rights reserved.
//

import Foundation

@testable import Croesus

import Quick
import Nimble

import RxSwift
import RxTest
import RxBlocking

class SurveyListViewModelTests: QuickSpec {

    override func spec() {
        describe("Survey List View Model") {
            var person: Person?
            var surveyPersistorMock: PersistorMock?
            var questionPersistorMock: PersistorMock?
            var surveyListViewModel: SurveyListViewModel?
            var testScheduler: TestScheduler?
            var disposeBag: DisposeBag?
            beforeEach {
                person = Person(id: "1", idNumber: 0)
                surveyPersistorMock = PersistorMock()
                questionPersistorMock = PersistorMock()
                guard let person = person,
                    let surveyPersistor = surveyPersistorMock,
                    let questionPersistor = questionPersistorMock else {
                    return fail()
                }
                surveyListViewModel = SurveyListViewModel(
                    person: person,
                    surveyPersistor: surveyPersistor,
                    questionPersistor: questionPersistor
                )
                testScheduler = TestScheduler(initialClock: 0)
                disposeBag = DisposeBag()
            }
            it("Fetches valid survey list") {
                guard let viewModel = surveyListViewModel,
                    let scheduler = testScheduler,
                    let disposeBag = disposeBag else {
                    return fail()
                }

                scheduler.createHotObservable([Recorded.next(300, ())])
                    .bind(to: viewModel.reload)
                    .disposed(by: disposeBag)

                let result = scheduler.start { viewModel.surveys }
                expect(result.events.count).to(equal(1))

                print(result.events)

                guard let surveyViewModel = result.events.first?.value.element?.first else {
                    return fail()
                }
                expect(surveyViewModel.title.value).to(equal("Test Survey"))
            }
            it("Emits showSurvey when survey is selected") {
                guard let viewModel = surveyListViewModel,
                    let questionPersistor = questionPersistorMock,
                    let scheduler = testScheduler,
                    let disposeBag = disposeBag else {
                    return fail()
                }

                let survey = Survey(id: "1", title: "Test Survey", questions: [])
                let surveyViewModel = SurveyViewModel(survey: survey, questionPersistor: questionPersistor)
                let selectSurveyObservable = scheduler.createHotObservable([
                    Recorded.next(300, surveyViewModel)
                ])

                selectSurveyObservable
                    .bind(to: viewModel.selectSurvey)
                    .disposed(by: disposeBag)

                let result = scheduler.start { viewModel.showSurvey.map { $0.title.value } }
                expect(result.events).to(equal([Recorded.next(300, survey.title)]))
            }
        }
    }
}
