//
//  RequestResponce.swift
//  CryptoVest
//
//  Created by Alexandr Mefisto on 19.08.2022.
//

import Foundation
struct CoinRequestResponce: Codable {
    let data: [Coin]
    let status: CoinResponceStatus
}
