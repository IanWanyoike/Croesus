//
//  NetworkModelType.swift
//  Croesus
//
//  Created by Ian Wanyoike on 03/02/2020.
//  Copyright © 2020 Pocket Pot. All rights reserved.
//

import Foundation
import Alamofire
import RxSwift

enum NetworkError: Error {
    case invalidResponse
}

protocol NetworkModelType: Codable {
    static var baseUrl: URL { get }
}

protocol NetworkServiceType {
    associatedtype T: NetworkModelType
    func request(from url: URL, with method: HTTPMethod, parameters: [String: Any]?) -> Single<T>
}

extension NetworkServiceType {
    func request(from url: URL = T.baseUrl, with method: HTTPMethod = .get, parameters: [String: Any]? = nil) -> Single<T> {
        return Single<T>.create { single in
            AF.request(
                url,
                method: method,
                parameters: parameters,
                encoding: JSONEncoding.default,
                headers: ["Content-Type": "application/json"]
            ).responseData { response in
                switch response.result {
                case .success(let data):
                    do {
                        single(.success(try JSONDecoder().decode(T.self, from: data)))
                    } catch {
                        single(.error(error))
                    }
                case .failure(let error):
                    single(.error(error))
                }
            }
            return Disposables.create()
        }
    }
}
