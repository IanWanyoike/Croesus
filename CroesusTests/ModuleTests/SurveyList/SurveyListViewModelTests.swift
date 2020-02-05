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

    var disposeBag: DisposeBag?

    override func spec() {
        describe("Survey List View Model") {
            var surveyListViewModel: SurveyListViewModel?
            var testScheduler: TestScheduler?
            beforeEach {
                let person = Person(id: "1", idNumber: 0)
                surveyListViewModel = SurveyListViewModel(person: person)
                testScheduler = TestScheduler(initialClock: 0)
                self.disposeBag = DisposeBag()
            }
            it("Fetches valid survey list") {
                guard let viewModel = surveyListViewModel,
                    let scheduler = testScheduler,
                    let disposeBag = self.disposeBag else {
                    return fail()
                }

                scheduler.createHotObservable([Recorded.next(300, ())])
                    .bind(to: viewModel.reload)
                    .disposed(by: disposeBag)

                let result = scheduler.start { viewModel.surveys }
                expect(result.events.count).to(equal(1))

                guard let surveyViewModel = result.events.first?.value.element?.first else {
                    return fail()
                }
                expect(surveyViewModel.title.value).to(equal("A short review of the Croesus iOS app."))
            }
            it("Emits showSurvey when survey is selected") {
                guard let viewModel = surveyListViewModel,
                    let scheduler = testScheduler,
                    let disposeBag = self.disposeBag else {
                    return fail()
                }

                let survey = Survey(id: "1", title: "Test Survey", questions: [])
                let surveyViewModel = SurveyViewModel(survey: survey)
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
