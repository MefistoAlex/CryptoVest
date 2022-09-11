//
//  ArticleTableViewHeader.swift
//  CryptoVest
//
//  Created by Alexandr Mefisto on 12.08.2022.
//

import SDWebImage
import UIKit

final class ArticleTableViewHeader: UIView {
    @IBOutlet var contentView: ArticleTableViewHeader!
    @IBOutlet var authorLabel: UILabel!
    @IBOutlet var articleHeaderLabel: UILabel!
    @IBOutlet var articleImageView: UIImageView!

    override init(frame: CGRect) {
        super.init(frame: frame)
        loadNib()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        loadNib()
    }

    private func loadNib() {
        Bundle.main.loadNibNamed("ArticleTableViewHeader", owner: self, options: nil)
        addSubview(contentView)
        contentView.autoresizingMask = [.flexibleHeight, .flexibleWidth]
        contentView.frame = bounds
    }

    func setArticle(article: Article) {
        articleHeaderLabel.text = article.title
        authorLabel.text = "\(article.author ?? "") \(article.publicised)"
        if let imageUrl = article.urlToImage {
            articleImageView.sd_setImage(with: URL(string: imageUrl), placeholderImage: UIImage(named: "welcome screen"))
        }
    }
}
