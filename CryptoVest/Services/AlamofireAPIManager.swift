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
                    completion: @escaping (T?, Error?) -> Void) where T: Decodable {
        let httpHeader = HTTPHeader(
            name: "X-CMC_PRO_API_KEY",
            value: "aba11fc0-6b34-41d5-ad50-602fabe047d5"
        )

        AF.request(urlString, method: HTTPMethod(rawValue: method.rawValue),
//                   parameters: <#T##Encodable?#>,
//                   encoder: <#T##ParameterEncoder#>,
                   headers: HTTPHeaders([httpHeader]))
            .validate()
            .responseDecodable(of: T.self) { response in
                completion(response.value, response.error)
            }
    }
}
