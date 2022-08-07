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
    
    @IBOutlet private var header: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        
    }
    override func viewWillAppear(_ animated: Bool) {
        
    }

    override func viewDidLayoutSubviews() {
        let colorFrom = UIColor(named: "MainFrom")!
        let colorTo = UIColor(named: "MainTo")!
    
        header.setGradientBackground(colorTop: colorFrom , colorBottom: colorTo)
        
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
            cell.backgroundColor = .systemGray6
        }
        return cell
    }
    
    
}

extension UIView {
    func setGradientBackground(colorTop: UIColor, colorBottom: UIColor) {
        //TODO: Fix the gradient problem
       
        let gradientLayer = CAGradientLayer()
            gradientLayer.colors = [colorTop.cgColor, colorBottom.cgColor]
            gradientLayer.startPoint = CGPoint(x: 0.0, y: 0.5)
            gradientLayer.endPoint = CGPoint(x: 1.0, y: 0.5)
            gradientLayer.frame = self.bounds
            
            self.layer.insertSublayer(gradientLayer, at: 0)
        self.frame = self.bounds
//        layoutSubviews()
    }
    
}
