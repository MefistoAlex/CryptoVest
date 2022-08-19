//
//  APIManager.swift
//  CryptoVest
//
//  Created by Alexandr Mefisto on 19.08.2022.
//

import Foundation
enum HttpMethod: String {
    case get, put, post, patch, delete
}

protocol APIManager {
    func request<T>(urlString: String,
                    method: HttpMethod,
                    dataType: T.Type,
                    headers: [String : String]?,
                    completion: @escaping (_ data: T?, _ error: Error?) -> Void) where T: Decodable
}
