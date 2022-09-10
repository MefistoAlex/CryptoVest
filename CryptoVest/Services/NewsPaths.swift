//
//  NewsPaths.swift
//  CryptoVest
//
//  Created by Alexandr Mefisto on 10.09.2022.
//

import Foundation
enum NewsPaths {
    case crypto, news

    var url: String {
        switch self {
        case .crypto:
            return "https://newsdata.io/api/1/crypto"
        case .news:
            return "https://newsdata.io/api/1/news"
        }
    }

    static var headers: [String: String] {
        return ["X-ACCESS-KEY": "pub_11088faea4a04046ba3c3c3ec227560da8353"]
    }
    
    static var apiKey: String {
        "pub_11088faea4a04046ba3c3c3ec227560da8353"
    }
}
