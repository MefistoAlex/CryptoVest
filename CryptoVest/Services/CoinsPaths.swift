//
//  Paths.swift
//  CryptoVest
//
//  Created by Alexandr Mefisto on 19.08.2022.
//

import Foundation
enum CoinsPaths {
    case latests, historical, new, info

    var url: String {
        switch self {
        case .latests:
            return "https://pro-api.coinmarketcap.com/v1/cryptocurrency/listings/latest"
        case .historical:
            return "https://pro-api.coinmarketcap.com/v1/cryptocurrency/listings/historical"
        case .new:
            return "https://pro-api.coinmarketcap.com/v1/cryptocurrency/listings/new"
        case .info:
            return "https://pro-api.coinmarketcap.com/v2/cryptocurrency/info"
        }
    }
    static var headers: [String : String] {
        return ["X-CMC_PRO_API_KEY" : "aba11fc0-6b34-41d5-ad50-602fabe047d5"]
    }
}
