//
//  NetworkService.swift
//  Croesus
//
//  Created by Ian Wanyoike on 03/02/2020.
//  Copyright © 2020 Pocket Pot. All rights reserved.
//

import RxSwift
import Alamofire

class NetworkService<Model: NetworkModelType>: NetworkServiceType {
    typealias T = Model
    func request(from url: URL = T.baseUrl, with method: HTTPMethod = .get, parameters: [String : Any]? = nil) -> Single<T> {
        // TODO: - Replace with api endpoint for surveys
        let data = NetworkResponseMocks.surveysResponse
        do {
            return Single.just(try JSONDecoder().decode(T.self, from: data))
        } catch {
            return Single.error(error)
        }
    }
}
