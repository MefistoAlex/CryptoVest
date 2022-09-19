//
//  ArticleViewController.swift
//  CryptoVest
//
//  Created by Alexandr Mefisto on 12.09.2022.
//

import SDWebImage
import UIKit

final class ArticleViewController: UIViewController {
    private var article: Article?

    // MARK: Outlets

    @IBOutlet private var tableView: UITableView!

    // MARK: Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        let notificationBellItem = UIBarButtonItem(image: UIImage(systemName: "bell.fill"), style: .plain, target: self, action: #selector(bellDidTab))
        let shareLinkItem = UIBarButtonItem(image: UIImage(named: CustomImages.shareLink.rawValue), style: .plain, target: self, action: #selector(shareLink))

        navigationItem.rightBarButtonItem = notificationBellItem
        navigationItem.rightBarButtonItems?.insert(shareLinkItem, at: 1)
        navigationController?.navigationBar.tintColor = .white
        setHeader()
    }

    @objc private func shareLink() {
        guard let article = article else { return }

        let url = URL(string: article.url)!
        let activityViewController = UIActivityViewController(
            activityItems: [url], applicationActivities: nil)
        activityViewController.isModalInPresentation = true

        present(activityViewController, animated: true, completion: nil)
    }

    @objc func bellDidTab() {
        let articleViewController = getViewController(viewStoryboardID: "NotificationViewController") as! NotificationViewController
        present(articleViewController, animated: true)
    }

    func setArticle(_ article: Article) {
        self.article = article
    }
}

// MARK: Table View Datasource

extension ArticleViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        0.33 * view.bounds.height
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        1
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ArticleDetailsTableViewCell", for: indexPath) as! ArticleDetailsTableViewCell
        if let article = article {
            cell.setArticle(article)
        }
        cell.delegate = self
        return cell
    }
}

// MARK: Table View delegate

extension ArticleViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let header = UIImageView()
        if let imageUrl = article?.urlToImage {
            header.sd_setImage(with: URL(string: imageUrl))
        }
        header.contentMode = .scaleAspectFill
        return header
    }
}
