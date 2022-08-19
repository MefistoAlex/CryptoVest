//
//  Quote.swift
//  CryptoVest
//
//  Created by Alexandr Mefisto on 19.08.2022.
//

import Foundation
struct Quote: Codable {
    let price: Double
    let change1h: Double
    let change24h: Double
    let change7d: Double
    enum CodingKeys: String, CodingKey {
        case price
        case change1h = "percent_change_1h"
        case change24h = "percent_change_24h"
        case change7d = "percent_change_7d"
    }
}
