//
//  NewsRequestResponce.swift
//  CryptoVest
//
//  Created by Alexandr Mefisto on 10.09.2022.
//

import Foundation
struct NewsRequestResponce: Decodable {
    let status: String
    let totalResults: Int
    let articles: [Article]
}
