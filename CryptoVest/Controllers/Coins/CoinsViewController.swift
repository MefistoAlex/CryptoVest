//
//  CoinsViewController.swift
//  CryptoVest
//
//  Created by Alexandr Mefisto on 06.08.2022.
//

import Alamofire
import UIKit

final class CoinsViewController: UIViewController {
    private var coins: [Coin] = []
    private var favouritesCoinsId = Set<Int>()
    
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
    private lazy var refreshControl: UIRefreshControl = {
        let refreshControl = UIRefreshControl()
        refreshControl.accessibilityViewIsModal = true
        refreshControl.addTarget(self, action: #selector(self.refreshTableData), for: .valueChanged)
        return refreshControl
    }()
    private lazy var coinService: CoinAPIServiceInterface = {
        CoinAPIService()
    }()

    private lazy var storageManager: StorageManager = {
        UserDefaultsStorageManager()
    }()

    @IBOutlet var loadingIndicator: UIActivityIndicatorView!
    @IBOutlet private var tableView: UITableView!

    // MARK: Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.addSubview(loadingIndicator)
        tableView.addSubview(refreshControl)
        
        tableView.delegate = self
        tableView.dataSource = self
        
        isLoading = true
        refreshTableData()
        setHeader()
    }

    override func viewWillDisappear(_ animated: Bool) {
        storageManager.setFavouriteCoins(coinsIdSet: favouritesCoinsId)
    }

    private func makeCoinFavourite(coinIndex: Int) {
        let coin = coins[coinIndex]
        if coin.isFavouriteNonOptional {
            favouritesCoinsId.remove(coin.id)
        } else {
            favouritesCoinsId.insert(coin.id)
        }
        coins[coinIndex].isFavourite = !coins[coinIndex].isFavouriteNonOptional
        tableView.reloadRows(at: [IndexPath(row: coinIndex, section: 0)], with: .fade)
        storageManager.setFavouriteCoins(coinsIdSet: favouritesCoinsId)
    }
    @objc private func refreshTableData() {
        
        coinService.getCoins(path: .latests) { coins, _ in
            if let coins = coins {
                self.favouritesCoinsId = self.storageManager.getFavouriteCoins()
                self.coins = coins
                for index in 0 ..< coins.count {
                    self.coins[index].isFavourite = self.favouritesCoinsId.contains(self.coins[index].id)
                }
                self.coins.sort { lhCoin, rhCoin in
                    return lhCoin.isFavouriteNonOptional
                }
                self.tableView.reloadData()
            }
            self.isLoading = false
            self.refreshControl.endRefreshing()
        }
       
    }
}

// MARK: Table View delegate

extension CoinsViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }

    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        print(self)
    }

    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let coin = coins[indexPath.row]
        let favouriteAction = UIContextualAction(
            style: coin.isFavouriteNonOptional ? .destructive : .normal,
            title: "Favourite") { [weak self] _, _, compleation in
                self?.makeCoinFavourite(coinIndex: indexPath.row
                )
                compleation(true)
            }
        favouriteAction.image = UIImage(
            systemName: coin.isFavouriteNonOptional ? "star.slash.fill" : "star"
        )?.withTintColor(.yellow, renderingMode: .alwaysTemplate)
        return UISwipeActionsConfiguration(actions: [favouriteAction])
    }
    func tableView(_ tableView: UITableView, didUpdateFocusIn context: UITableViewFocusUpdateContext, with coordinator: UIFocusAnimationCoordinator) {
        print("some")
    }
    
}

// MARK: Table View data source

extension CoinsViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        coins.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "CryptoCoinTableViewCell", for: indexPath) as? CryptoCoinTableViewCell else { return UITableViewCell() }
        let coin = coins[indexPath.row]
        cell.setCoin(coin: coin)
        if indexPath.row % 2 == 1 {
            cell.backgroundColor = .systemGray6
        } else {
            cell.backgroundColor = .clear
        }
        return cell
    }
}
