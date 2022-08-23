//
//  CoinLogoRequestResponce.swift
//  CryptoVest
//
//  Created by Alexandr Mefisto on 19.08.2022.
//

import Foundation
struct CoinLogoRequestResponce: Codable {
    let data: [Int: CoinLogo]
    let status: CoinResponceStatus
}
