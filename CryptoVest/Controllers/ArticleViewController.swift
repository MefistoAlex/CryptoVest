//
//  ArticleViewController.swift
//  CryptoVest
//
//  Created by Alexandr Mefisto on 12.09.2022.
//

import UIKit

final class ArticleViewController: UIViewController {
    private var article: Article?

    @IBOutlet private var tableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        setHeader()
        
    }

    func setArticle(_ article: Article) {
        self.article = article
    }
}

extension ArticleViewController: UITableViewDelegate {
}

extension ArticleViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        1
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ArticleDetailsTableViewCell", for: indexPath) as! ArticleDetailsTableViewCell
        if let article = article {
            cell.setArticle(article)
        }
        return cell
    }
}
