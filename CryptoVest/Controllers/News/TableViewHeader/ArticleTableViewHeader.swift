//
//  ArticleTableViewHeader.swift
//  CryptoVest
//
//  Created by Alexandr Mefisto on 12.08.2022.
//

import UIKit

class ArticleTableViewHeader: UIView {

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
//        fatalError("init(coder:) has not been implemented")
    }
    
    func loadNib() {
        Bundle.main.loadNibNamed("ArticleTableViewHeader", owner: self, options: nil)
        addSubview(contentView)
        contentView.autoresizingMask = [.flexibleHeight, .flexibleWidth]
        contentView.frame = self.bounds
    }
    func setArticle(article: Article) {
        
        articleHeaderLabel.text = article.title
        authorLabel.text = "\(article.authror), \(article.publicised)"
        articleImageView.image = UIImage(named: article.image)
    }
}
