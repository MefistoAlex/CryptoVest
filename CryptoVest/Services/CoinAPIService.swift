//
//  CoinAPIService.swift
//  CryptoVest
//
//  Created by Alexandr Mefisto on 19.08.2022.
//

import Foundation
protocol CoinAPIServiceInterface {
    func getCoins(path: CoinsPaths, parameters: CoinRequestParameters?, completion: @escaping (_ responce: CoinRequestResponce?, _ error: Error?) -> Void)

    func getCoins(path: CoinsPaths,
                  completion: @escaping (CoinRequestResponce?, Error?) -> Void)
}

final class CoinAPIService: CoinAPIServiceInterface {
    private let apiManager: APIManager

    init() {
        apiManager = AlamofireAPIManager()
    }

    func getCoins(path: CoinsPaths, parameters: CoinRequestParameters?,
                  completion: @escaping (CoinRequestResponce?, Error?) -> Void) {
        let parameters: CoinRequestParameters = parameters ?? CoinRequestParameters()
        apiManager.request(urlString: path.url,
                           method: .get,
                           dataType: CoinRequestResponce.self,
                           headers: CoinsPaths.headers,
                           parameters: parameters.toDictionary) { data, error in
            completion(data, error)
        }
    }

    func getCoins(path: CoinsPaths,
                  completion: @escaping (CoinRequestResponce?, Error?) -> Void) {
        getCoins(path: path, parameters: nil, completion: completion)
    }
}
