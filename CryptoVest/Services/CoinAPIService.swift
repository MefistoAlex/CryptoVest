//
//  CoinAPIService.swift
//  CryptoVest
//
//  Created by Alexandr Mefisto on 19.08.2022.
//

import Foundation
protocol CoinAPIServiceInterface {
    func getCoins(completion: @escaping (_ responce: RequestResponce?, _ error: Error?) -> Void)
}

final class CoinAPIService: CoinAPIServiceInterface {
    private let apiManager: APIManager

    init() {
        apiManager = AlamofireAPIManager()
    }

    func getCoins(completion: @escaping (RequestResponce?, Error?) -> Void) {
        apiManager.request(urlString: "https://pro-api.coinmarketcap.com/v1/cryptocurrency/listings/latest",
                           method: .get,
                           dataType: RequestResponce.self) { data, error in
            completion(data, error)
        }
    }
}
