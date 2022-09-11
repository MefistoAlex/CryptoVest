//
//  ArticleTableViewCell.swift
//  CryptoVest
//
//  Created by Alexandr Mefisto on 09.08.2022.
//

import SDWebImage
import UIKit

class ArticleTableViewCell: UITableViewCell {
    @IBOutlet var articleHeader: UILabel!
    @IBOutlet var authorAndDate: UILabel!
    @IBOutlet var articleImage: UIImageView!
}

extension ArticleTableViewCell {
    func setArticle(article: Article) {
        articleHeader.text = article.title
        authorAndDate.text = "\(article.author ?? "") \(article.publicised)"

        if let imageUrl = article.urlToImage {
            articleImage.sd_setImage(with: URL(string: imageUrl), placeholderImage: UIImage(named: "welcome screen"))
        }

        articleImage.layer.cornerRadius = articleImage.frame.height * 0.025
    }
}
