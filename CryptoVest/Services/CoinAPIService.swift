//
//  CoinAPIService.swift
//  CryptoVest
//
//  Created by Alexandr Mefisto on 19.08.2022.
//

import Foundation
protocol CoinAPIServiceInterface {
    func getCoins(path: CoinsPaths, parameters: CoinRequestParameters?, completion: @escaping (_ coins: [Coin]?, _ error: Error?) -> Void)

    func getCoins(path: CoinsPaths,
                  completion: @escaping ([Coin]?, Error?) -> Void)

    func getCoinLogos(path: CoinsPaths, coinsList: [String: String],
                      completion: @escaping (CoinLogoRequestResponce?, Error?) -> Void)
}

final class CoinAPIService: CoinAPIServiceInterface {
    private let apiManager: APIManager

    init() {
        apiManager = AlamofireAPIManager()
    }

    func getCoins(path: CoinsPaths, parameters: CoinRequestParameters?,
                  completion: @escaping ([Coin]?, Error?) -> Void) {
        let parameters: CoinRequestParameters = parameters ?? CoinRequestParameters()
        apiManager.request(urlString: path.url,
                           method: .get,
                           dataType: CoinRequestResponce.self,
                           headers: CoinsPaths.headers,
                           parameters: parameters.toDictionary) { data, error in
            var resultCoins: [Coin]?
            if let coins = data?.data {
                let coinsID = coins.map { String($0.id) }
                    .joined(separator: ",")

                self.getCoinLogos(path: .info, coinsList: ["id": coinsID]) { [self] data, error in

                    if let data = data {
                        let coinLogos = data.data
                        resultCoins = self.setLogos(coins: coins, logos: coinLogos)
                    } else {
                        resultCoins = coins
                    }
                    completion(resultCoins, error)
                }
            } else {
                completion(data?.data, error)
            }
        }
    }

    func getCoins(path: CoinsPaths,
                  completion: @escaping ([Coin]?, Error?) -> Void) {
        getCoins(path: path, parameters: nil, completion: completion)
    }

    func getCoinLogos(path: CoinsPaths, coinsList: [String: String],
                      completion: @escaping (CoinLogoRequestResponce?, Error?) -> Void) {
        apiManager.request(urlString: path.url,
                           method: .get,
                           dataType: CoinLogoRequestResponce.self,
                           headers: CoinsPaths.headers,
                           parameters: coinsList) { data, error in
            completion(data, error)
        }
    }

    private func setLogos(coins: [Coin], logos: [Int: CoinLogo]) -> [Coin] {
        var resultCoins = [Coin]()
        for coin in coins {
            var newCoin = coin
            newCoin.logo = logos[newCoin.id]?.logo
            resultCoins.append(newCoin)
        }
        return resultCoins
    }
}
