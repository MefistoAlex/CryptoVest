//
//  NewsAPIService.swift
//  CryptoVest
//
//  Created by Alexandr Mefisto on 10.09.2022.
//

import Foundation
protocol NewsAPIServiceInterface {
    func getNews(path: NewsPaths, parameters: NewsRequestParameters?, completion: @escaping (_ articles: [Article]?, _ error: Error?) -> Void)
    func getNews(completion: @escaping (_ articles: [Article]?, _ error: Error?) -> Void)
}

final class NewsAPIService: NewsAPIServiceInterface {
    private let apiManager: APIManager

    init() {
        apiManager = AlamofireAPIManager()
    }

    func getNews(completion: @escaping ([Article]?, Error?) -> Void) {
        getNews(path: NewsPaths.news, parameters: nil, completion: completion)
    }

    func getNews(path: NewsPaths, parameters: NewsRequestParameters?, completion: @escaping (_ articles: [Article]?, _ error: Error?) -> Void) {
        let parameters: NewsRequestParameters = parameters ?? NewsRequestParameters()
        apiManager.request(urlString: path.url,
                           method: .get,
                           dataType: NewsRequestResponce.self,
                           headers: NewsPaths.headers,
                           parameters: parameters.toDictionary) { data, error in

            completion(data?.articles, error)
        }
    }
}
