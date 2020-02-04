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
import RxBlocking

class SurveyListViewModelTests: QuickSpec {
    override func spec() {
        describe("Load Survey List") {
            var surveyListViewModel: SurveyListViewModel?
            beforeEach {
                let person = Person(id: "1", idNumber: 0)
                surveyListViewModel = SurveyListViewModel(person: person)
            }
            it("Fetches And Decodes Survey List") {
                let disposeBag = DisposeBag()
                waitUntil { done in
                    guard let completable = surveyListViewModel?.load() else {
                        fail("Failed to initialize SurveyListViewModel")
                        return
                    }
                    completable.subscribe { event in
                        switch event {
                        case .completed:
                            done()
                        case .error(let error):
                            fail("Failed to load surveys, error: \(error)")
                        }
                    }.disposed(by: disposeBag)
                }
            }
        }
    }
}
