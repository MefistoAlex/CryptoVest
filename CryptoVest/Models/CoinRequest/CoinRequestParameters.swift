//
//  CoinRequestParameters.swift
//  CryptoVest
//
//  Created by Alexandr Mefisto on 19.08.2022.
//

import Foundation
struct CoinRequestParameters {
    let start: Int = 1
    let limit: Int = 100
    let priceMin: Double? = nil
    let priceMax: Double? = nil
    let sort: CoinSort = .marketCap
    let sortDir: CoinSortDirection = .desc
    let cryptocurrencyType: CoinCryptocurrencyType = .coins

    var defaultParametrs: CoinRequestParameters {
        CoinRequestParameters()
    }

    var toDictionary: [String: Any] {
        var dictionary = [
            "start": start,
            "limit": limit,
            "sort": sort.rawValue,
            "sort_dir": sortDir.rawValue,
            "cryptocurrency_type": cryptocurrencyType.rawValue,
        ] as [String: Any]

        if let priceMin = priceMin {
            dictionary.updateValue(priceMin, forKey: "price_min")
        }

        if let priceMax = priceMax {
            dictionary.updateValue(priceMax, forKey: "price_max")
        }
        return dictionary
    }
}

extension CoinRequestParameters {
    enum CoinSort: String {
        case name
        case symbol
        case marketCap = "market_cap"
        case price
    }

    enum CoinSortDirection: String {
        case asc
        case desc
    }

    enum CoinCryptocurrencyType: String {
        case all, coins, tokens
    }
}
