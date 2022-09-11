//
//  NewsRequestParameters.swift
//  CryptoVest
//
//  Created by Alexandr Mefisto on 10.09.2022.
//

import Foundation
struct NewsRequestParameters {
    let request: String = "crypto cryptocurrency"
    let language: String = "en"
    let pageSize: Int = 20
    var page: Int = 1

    var defaultParametrs: NewsRequestParameters {
        NewsRequestParameters()
    }

    var toDictionary: [String: Any] {
        [
            "q": request,
            "pageSize": pageSize,
            "language": language,
        ]
    }
}

// MARK: Docs

// https://newsapi.org/docs/
