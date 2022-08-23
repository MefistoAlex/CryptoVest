//
//  Coin.swift
//  CryptoVest
//
//  Created by Alexandr Mefisto on 06.08.2022.
//
struct Coin: Codable {
    let id: Int
    let symbol: String
    let name: String
    let quote: [String: Quote]
    var logo: String?

    var price: Double {
        quote.first?.value.price ?? 0
    }

    var change: Double {
        quote.first?.value.change24h ?? 0
    }
}
