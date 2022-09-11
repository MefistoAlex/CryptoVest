//
//  NewsPaths.swift
//  CryptoVest
//
//  Created by Alexandr Mefisto on 10.09.2022.
//

import Foundation
enum NewsPaths {
    case news

    var url: String {
        switch self {
        case .news:
            return "https://newsapi.org/v2/everything"
        }
    }

    static var headers: [String: String] {
        return ["X-Api-Key": "03ab902f6f0e4fddb155f62a4fe2de1f"]
    }
    //MARK: Docs
    //https://newsapi.org/docs
}
