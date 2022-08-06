//
//  Coin.swift
//  CryptoVest
//
//  Created by Alexandr Mefisto on 06.08.2022.
//
struct Coin {
    let coinID: String
    let name: String
    let price: Double
    let change: Double
}

extension Coin {
    func getCoins() -> [Coin] {
        return [
            Coin(coinID: "BTC", name: "Bitcoin", price: 17487.56 , change: 2.16),
            Coin(coinID: "ETH", name: "Ethereum", price: 21.56 , change: -1.98),
            Coin(coinID: "BCN", name: "Bytecoin", price: 32.48  , change: 4.72),
            Coin(coinID: "DASH", name: "Dash", price: 89.07 , change: 11.36),
            Coin(coinID: "OMG", name: "OmiceCo", price: 21.19 , change: -1.98),
            Coin(coinID: "PRC", name: "Peercoin", price: 129.89 , change: 23.8),
        ]
    }
}
