//
//  Article.swift
//  CryptoVest
//
//  Created by Alexandr Mefisto on 09.08.2022.
//

import Foundation
struct Article {
    let header: String
    let authror: String
    let date: Date
    let image: String
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
        dateFormatter.dateFormat = "yyyy.MM.dd"

        return dateFormatter.string(from: date)
    }

    static func getNews() -> [Article] {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        return [
            Article(
                header: "Krypton Capital Founder Considers Legal Action Against Jamie Dimon",
                authror: "Christine Masters",
                date: dateFormatter.date(from: "2022-08-12 18:00:00")!,
                image: "Article0"
            ),
            Article(
                header: "British Cryptocurrency Electroneum Suffers Cyber Attack Locking Out Investors",
                authror: "C. Masters",
                date: dateFormatter.date(from: "2022-08-06 12:50:00")!,
                image: "Article1"
            ),
            Article(
                header: "To Regulate or Not? Securities Commission in Malaysia Talk Up Cryptocurrency Framework",
                authror: "A. Antonovici",
                date: dateFormatter.date(from: "2022-08-05 12:50:00")!,
                image: "Article2"
            ),
            Article(
                header: "Kik Chat ICO Draws Top VCs; We Carefully Review Why...",
                authror: "H. Naseer",
                date: dateFormatter.date(from: "2022-08-04 12:50:00")!,
                image: "Article3"
            ),
            Article(
                header: "Deloitte Lists Key Principles for Blockchain Adoption in Financial Sector",
                authror: "T. DeSue",
                date: dateFormatter.date(from: "2022-08-03 12:50:00")!,
                image: "Article4"
            ),
            Article(
                header: "Wharton MBA: Blockchain Course Set for Spring 2018",
                authror: "M. Gomez",
                date: dateFormatter.date(from: "2022-08-02 12:50:00")!,
                image: "Article5"
            ),
            Article(
                header: "China Crypto Ban Continues to Boost Bitcoin OTC Market Activity",
                authror: "C. Masters",
                date: dateFormatter.date(from: "2022-08-02 12:50:00")!,
                image: "Article6"
            ),
            Article(
                header: "Vatican in Discussions to Address Crypto Use in Human Trafficking",
                authror: "H. Nasser",
                date: dateFormatter.date(from: "2022-08-02 12:50:00")!,
                image: "Article7"
            ),
        ]
    }
}
