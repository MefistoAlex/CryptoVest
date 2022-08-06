//
//  CoinsViewController.swift
//  CryptoVest
//
//  Created by Alexandr Mefisto on 06.08.2022.
//

import UIKit

final class CoinsViewController: UIViewController {
    private var coins = Coin.getCoins()
    @IBOutlet private var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        // Do any additional setup after loading the view.
    }


}

extension CoinsViewController: UITableViewDelegate {
    
}

extension CoinsViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        coins.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell =  tableView.dequeueReusableCell(withIdentifier: "CryptoCoinTableViewCell", for: indexPath) as? CryptoCoinTableViewCell else { return UITableViewCell() }
        cell.setCoin(coin: coins[indexPath.row])
        if indexPath.row % 2 == 1 {
            cell.backgroundColor = .placeholderText
        }
        return cell
    }
    
    
}

