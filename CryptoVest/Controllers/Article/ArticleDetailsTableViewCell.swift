//
//  ArticleDetailsTableViewCell.swift
//  CryptoVest
//
//  Created by Alexandr Mefisto on 14.09.2022.
//

import UIKit

final class ArticleDetailsTableViewCell: UITableViewCell {
    var delegate: ArticleViewController?
    @IBOutlet private var articleDescriptionLabel: UILabel!
    @IBOutlet private var articleContentLabel: UILabel!
    @IBOutlet private var articleTitleLabel: UILabel!

    @IBAction func getNotificationButtonDidTap(_ sender: Any) {
        delegate?.bellDidTab()
    }

    func setArticle(_ article: Article) {
        articleDescriptionLabel.text = article.description
        articleContentLabel.text = article.content
        articleTitleLabel.text = article.title
    }
}
