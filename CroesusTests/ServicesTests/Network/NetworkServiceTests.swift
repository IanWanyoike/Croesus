//
//  NetworkServiceTests.swift
//  CroesusTests
//
//  Created by Ian Wanyoike on 04/02/2020.
//  Copyright © 2020 Pocket Pot. All rights reserved.
//

import Foundation

@testable import Croesus

import Quick
import Nimble

import RxBlocking

import OHHTTPStubs

class NetworkServiceTests: QuickSpec {
    override func spec() {
        describe("Request") {
            var networkService: NetworkServiceMock<NetworkModelMock>?
            var modelStub: HTTPStubsDescriptor?
            beforeEach {
                networkService = NetworkServiceMock()
            }
            context("Successful Response") {
                beforeEach {
                    guard let stubPath = OHPathForFile("NetworkModel.json", type(of: self)) else { return }
                    modelStub = stub(condition: isAbsoluteURLString(NetworkModelMock.baseUrl.absoluteString)) { _ -> HTTPStubsResponse in
                        return fixture(filePath: stubPath, headers: ["Content-Type": "application/json"])
                        .requestTime(0.0, responseTime: OHHTTPStubsDownloadSpeedWifi)
                    }
                }
                it("Fetches And Decodes Associated Type") {
                    let expectedModel = NetworkModelMock(id: 1, name: "Job")
                    let networkModel = try? networkService?.request().toBlocking().first()
                    expect(networkModel).notTo(beNil())
                    expect(networkModel).to(equal(expectedModel))
                }
            }
            context("Unsuccessful Response") {
                it("Fails Retrieve and Decode Associated Type") {
                    let networkModel = try? networkService?.request().toBlocking().first()
                    expect(networkModel).to(beNil())
                }
            }
            afterEach {
                guard let stub = modelStub else { return }
                HTTPStubs.removeStub(stub)
            }
        }
    }
}
