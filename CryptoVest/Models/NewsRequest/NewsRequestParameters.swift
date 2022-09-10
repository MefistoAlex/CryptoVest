//
//  NewsRequestParameters.swift
//  CryptoVest
//
//  Created by Alexandr Mefisto on 10.09.2022.
//

import Foundation
struct NewsRequestParameters {
    
    let apikey:String = NewsPaths.apiKey
    var language: String = "en"
    var request: String? = nil
    
    var defaultParametrs: NewsRequestParameters {
        NewsRequestParameters()
    }

    var toDictionary: [String: Any] {
        var dictionary = [
             "language": language,
             "apikey": apikey
        ]
        if let request = request {
            dictionary.updateValue(request, forKey: "q")
        }
        return dictionary
    }
}
//MARK: Docs
//https://newsdata.io/docs
