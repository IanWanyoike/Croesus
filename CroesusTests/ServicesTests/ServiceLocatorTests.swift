//
//  ServiceLocatorTests.swift
//  CroesusTests
//
//  Created by Ian Wanyoike on 04/02/2020.
//  Copyright © 2020 Pocket Pot. All rights reserved.
//

import Foundation

@testable import Croesus

import Quick
import Nimble

class ServiceLocatorTests: QuickSpec {
    override func spec() {
        describe("Service Locator") {
            var serviceLocator: ServiceLocator?
            beforeEach {
                serviceLocator = ServiceLocator()
            }
            it("Saves And Retrieves Generic Services") {
                let networkService = NetworkServiceMock<NetworkModelMock>()
                serviceLocator?.add(networkService)
                let retrievedNetworkService: NetworkServiceMock<NetworkModelMock>? = serviceLocator?.get()
                expect(retrievedNetworkService).toNot(beNil())
                expect(retrievedNetworkService).to(be(networkService))
            }
        }
    }
}
