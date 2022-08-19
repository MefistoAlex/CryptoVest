//
//  CoinRequestParameters.swift
//  CryptoVest
//
//  Created by Alexandr Mefisto on 19.08.2022.
//

import Foundation
struct CoinRequestParameters: Codable {
    let start: Int = 1
    let limit: Int = 100
    let priceMin: Double? = nil
    let priceMax: Double? = nil
    let sort: CoinSort = .marketCap
    let sortDir: CoinSortDirection = .asc
    let cryptocurrencyType: CoinCryptocurrencyType = .coins

    enum CodingKeys: String, CodingKey {
        case start
        case limit
        case priceMin = "price_min"
        case priceMax = "price_max"
        case sort
        case sortDir = "sort_dir"
        case cryptocurrencyType = "cryptocurrency_type"
    }
}

extension CoinRequestParameters {
    enum CoinSort: String, Codable {
        case name
        case symbol
        case marketCap = "market_cap"
        case price
    }

    enum CoinSortDirection: String, Codable {
        case asc
        case desc
    }

    enum CoinCryptocurrencyType: String, Codable {
        case all, coins, tokens
    }
}
