//
//  Article.swift
//  CryptoVest
//
//  Created by Alexandr Mefisto on 09.08.2022.
//

import Foundation
struct Article: Decodable {
    let title: String
    let url: String
    let urlToImage: String?
    let description: String
    let publishedAt: String?
    let content: String
    var author: String?

    var date: Date {
        guard let pubDate = publishedAt else { return Date() }
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy'-'MM'-'dd'T'HH':'mm':'ss'Z'"
        let date = dateFormatter.date(from: pubDate)
        return date ?? Date()
    }
}

extension Article {
    var publicised: String {
        let seconds = abs(Date().distance(to: date))
        // if time interval < 1 min
        if seconds < 60 {
            return "just now"
        }

        // if time interval < 1 hour
        if seconds < 60 * 60 {
            return "\(Int(seconds / 60)) mins ago"
        }

        // if time interval < 1 day
        if seconds < 60 * 60 * 24 {
            return "\(Int(seconds / (60 * 60))) hours ago"
        }

        // if time interval < 10 days
        if seconds < 60 * 60 * 24 * 10 {
            return "\(Int(seconds / (60 * 60 * 24))) days ago"
        }

        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd.MM.yyyy"

        return dateFormatter.string(from: date)
    }
}
