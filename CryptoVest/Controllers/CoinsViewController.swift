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
        setHeader()
        
    }
}

extension CoinsViewController: UITableViewDelegate {
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

extension UIViewController {
    func setHeader() {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.image = UIImage(named: "logo")
        navigationItem.titleView = imageView

        let colorFrom = UIColor(named: "MainFrom")!
        let colorTo = UIColor(named: "MainTo")!
        view.setGradientBackground(colorTop: colorFrom, colorBottom: colorTo)

         // making header without blur
        navigationController?.navigationBar.standardAppearance.configureWithTransparentBackground()
        navigationController?.navigationBar.barStyle = .black
        
       
    }
}

extension UIView {
    func setGradientBackground(colorTop: UIColor, colorBottom: UIColor) {
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = [colorTop.cgColor, colorBottom.cgColor]
        gradientLayer.startPoint = CGPoint(x: 0.0, y: 0.5)
        gradientLayer.endPoint = CGPoint(x: 1.0, y: 0.5)
        gradientLayer.frame = bounds
        gradientLayer.frame.size.width += 5
        let count = UInt32(layer.sublayers?.count ?? 0)
        layer.insertSublayer(gradientLayer, at: count - 1)
    }
}
