//
//  ExtensionTests.swift
//  CroesusTests
//
//  Created by Ian Wanyoike on 04/02/2020.
//  Copyright © 2020 Pocket Pot. All rights reserved.
//

import Foundation

@testable import Croesus

import Quick
import Nimble

class CollectionExtensionTests: QuickSpec {
    override func spec() {
        describe("Nil Or Empty") {
            it("Returns True If Optional Collection Is Nil Or Empty") {
                var string: String? = "Me"
                expect(string.nilOrEmpty()).to(beFalse())
                string = ""
                expect(string.nilOrEmpty()).to(beTrue())
                string = nil
                expect(string.nilOrEmpty()).to(beTrue())
            }
        }
    }
}
