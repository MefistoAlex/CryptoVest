//
//  ArticleTableViewCell.swift
//  CryptoVest
//
//  Created by Alexandr Mefisto on 09.08.2022.
//

import UIKit

class ArticleTableViewCell: UITableViewCell {
    @IBOutlet var articleHeader: UILabel!
    @IBOutlet var authorAndDate: UILabel!
    @IBOutlet var articleImage: UIImageView!
}

extension ArticleTableViewCell {
    func setArticle(article: Article) {
        articleHeader.text = article.title
        authorAndDate.text = "\(article.authror), \(article.publicised)"
        articleImage.image = UIImage(named: article.image)
        articleImage.layer.cornerRadius = articleImage.frame.height * 0.025
    }
}
