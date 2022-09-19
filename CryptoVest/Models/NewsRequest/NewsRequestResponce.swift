//
//  NewsRequestResponce.swift
//  CryptoVest
//
//  Created by Alexandr Mefisto on 10.09.2022.
//

import Foundation
struct NewsRequestResponce: Decodable {
    let status: String
    let total_hits: Int
    let articles: [Article]
}
