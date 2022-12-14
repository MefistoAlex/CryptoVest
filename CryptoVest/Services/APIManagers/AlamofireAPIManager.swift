//
//  AlamofireAPIManager.swift
//  CryptoVest
//
//  Created by Alexandr Mefisto on 19.08.2022.
//

import Alamofire
import Foundation
final class AlamofireAPIManager: APIManager {
    func request<T>(urlString: String,
                    method: HttpMethod,
                    dataType: T.Type,
                    headers: [String: String]?,
                    parameters: Parameters?,
                    completion: @escaping (T?, Error?) -> Void) where T: Decodable {
        var httpHeaders: HTTPHeaders?
        if let headers = headers {
            httpHeaders = HTTPHeaders(headers)
        }

        AF.request(urlString, method: HTTPMethod(rawValue: method.rawValue),
                   parameters: parameters,
//                   encoder: <#T##ParameterEncoder#>,
                   headers: httpHeaders)
            .validate()
            .responseDecodable(of: T.self) { response in
                completion(response.value, response.error)
            }
    }
}
