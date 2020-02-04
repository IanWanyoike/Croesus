//
//  NetworkModelMock.swift
//  CroesusTests
//
//  Created by Ian Wanyoike on 04/02/2020.
//  Copyright © 2020 Pocket Pot. All rights reserved.
//

import Foundation

@testable import Croesus

struct NetworkModelMock: NetworkModelType {

    static var pathComponent = "model_mock"
    static var baseUrl = Constants.baseURL.appendingPathComponent(pathComponent)

    var id: Int
    var name: String
}

extension NetworkModelMock: Equatable {
    static func == (lhs: NetworkModelMock, rhs: NetworkModelMock) -> Bool {
        return lhs.id == rhs.id && lhs.name == rhs.name
    }
}

class NetworkServiceMock<Model: NetworkModelType>: NetworkServiceType {
    typealias T = Model
}
