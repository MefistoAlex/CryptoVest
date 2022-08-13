//
//  NewsViewController.swift
//  CryptoVest
//
//  Created by Alexandr Mefisto on 09.08.2022.
//

import UIKit

final class NewsViewController: UIViewController {
    private let coins = Coin.getCoins()
    private let articles = Article.getNews()
    @IBOutlet var tableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        setHeader()
        
    }
  
}

extension NewsViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        0.66 * view.bounds.height
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        articles.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "TopCoinsTableViewCell", for: indexPath) as! TopCoinsTableViewCell
            cell.setCoins(coins: coins)
            return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "ArticleTableViewCell", for: indexPath) as! ArticleTableViewCell
            cell.setArticle(article: articles[indexPath.row] )
            return cell
        }
    }
}

extension NewsViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = ArticleTableViewHeader()
        headerView.setArticle(article: articles[0])
        return headerView
    }
}
