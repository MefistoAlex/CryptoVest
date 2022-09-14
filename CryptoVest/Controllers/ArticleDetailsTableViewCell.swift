//
//  ArticleDetailsTableViewCell.swift
//  CryptoVest
//
//  Created by Alexandr Mefisto on 14.09.2022.
//

import UIKit

final class ArticleDetailsTableViewCell: UITableViewCell {
    @IBOutlet private var articleImageView: UIImageView!
    @IBOutlet private var articleDescriptionLabel: UILabel!
    @IBOutlet private var articleContentLabel: UILabel!
    
   

    @IBAction func getNotificationButtonDidTap(_ sender: Any) {
    }
    
    func setArticle(_ article : Article) {
        if let urlString = article.urlToImage {
            articleImageView.sd_setImage(with: URL(string: urlString))
        }
        articleDescriptionLabel.text = article.description
        articleContentLabel.text = article.content
    }
}
