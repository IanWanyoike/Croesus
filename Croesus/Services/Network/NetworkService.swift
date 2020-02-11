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
    func request(from url: URL = T.baseUrl, with method: HTTPMethod = .get, parameters: [String: Any]? = nil) -> Single<T> {
        // TODO: - Replace with api endpoint for surveys / questions
        var data: Data?
        if T.self == SurveyList.self {
            data = NetworkResponseMocks.surveysResponse
        } else if T.self == QuestionList.self {
            data = NetworkResponseMocks.questionsData
        }
        guard let json = data else { return Single.error(NetworkError.invalidResponse) }
        do {
            return Single.just(try JSONDecoder().decode(T.self, from: json))
        } catch {
            return Single.error(error)
        }
    }
}
