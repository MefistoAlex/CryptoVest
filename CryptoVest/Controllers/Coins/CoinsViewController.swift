//
//  CoinsViewController.swift
//  CryptoVest
//
//  Created by Alexandr Mefisto on 06.08.2022.
//

import UIKit

final class CoinsViewController: UIViewController {
    private var coins: [Coin] = []
    private var isLoading: Bool = false {
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

    @IBOutlet var loadingIndicator: UIActivityIndicatorView!
    @IBOutlet private var tableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.addSubview(loadingIndicator)
        tableView.delegate = self
        tableView.dataSource = self
        isLoading = true
        coinService.getCoins(path: .latests) { coins, _ in
            if let coins = coins {
                self.coins = coins
                self.tableView.reloadData()
            }
            self.isLoading = false
        }
        setHeader()
    }
}

extension CoinsViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}

extension CoinsViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        coins.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "CryptoCoinTableViewCell", for: indexPath) as? CryptoCoinTableViewCell else { return UITableViewCell() }
        cell.setCoin(coin: coins[indexPath.row])
        if indexPath.row % 2 == 1 {
            cell.backgroundColor = .systemGray6
        } else {
            cell.backgroundColor = .clear
        }
        return cell
    }
}
