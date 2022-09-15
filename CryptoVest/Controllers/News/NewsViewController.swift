//
//  NewsViewController.swift
//  CryptoVest
//
//  Created by Alexandr Mefisto on 09.08.2022.
//

import UIKit
import UniformTypeIdentifiers

final class NewsViewController: UIViewController {
    private var coins: [Coin] = []
    private var articles: [Article] = []
    private var isLoading: Bool = true {
        didSet {
            if isLoading {
                loadingIndicator.startAnimating()
                loadingIndicator.hidesWhenStopped = true
            } else {
                loadingIndicator.stopAnimating()
            }
        }
    }

    private lazy var coinService: CoinAPIServiceInterface = {
        CoinAPIService()
    }()

    private lazy var newsService: NewsAPIServiceInterface = {
        NewsAPIService()
    }()

    // MARK: Outlets

    @IBOutlet private var tableView: UITableView!
    @IBOutlet private var loadingIndicator: UIActivityIndicatorView!

    // MARK: Lyfecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        tableView.addSubview(loadingIndicator)
        isLoading = true

        coinService.getCoins(path: .latests) { coins, _ in
            if let coins = coins {
                self.coins = coins
            }
            self.newsService.getNews { articles, _ in
                if let articles = articles {
                    self.articles = articles
                }
                self.tableView.reloadData()
                self.isLoading = false
            }
        }

        setHeader()
    }

    // MARK: Privates

    private func showArticleDetails(index: Int) {
        let articleViewController = getViewController(viewStoryboardID: "ArticleViewController") as! ArticleViewController
        articleViewController.setArticle(articles[index])
        navigationController?.pushViewController(articleViewController, animated: true)
    }

    @objc private func headerTapped() {
        showArticleDetails(index: 0)
    }
}

// MARK: Table View data sourse

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
            cell.setArticle(article: articles[indexPath.row])
            return cell
        }
    }
}

// MARK: Table View delegate

extension NewsViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row > 0 {
            showArticleDetails(index: indexPath.row)
        }
        tableView.deselectRow(at: indexPath, animated: true)
    }

    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        if isLoading {
            return UIView()
        } else {
            let headerView = ArticleTableViewHeader()
            if articles.count > 0 {
                headerView.setArticle(article: articles[0])
            }
            headerView.tapGestureRecognizer.addTarget(self, action: #selector(headerTapped))
            return headerView
        }
    }
}
