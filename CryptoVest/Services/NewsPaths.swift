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
            return "https://api.newscatcherapi.com/v2/search"
        }
    }

    static var headers: [String: String] {
        return ["x-api-key": "14nRIX0mmr6bRyruUd-rkGr7ZTw5T9cIfbr_3CLZudw"]
    }

    // MARK: Docs

    // https://docs.newscatcherapi.com/api-docs/endpoints/search-news
}
