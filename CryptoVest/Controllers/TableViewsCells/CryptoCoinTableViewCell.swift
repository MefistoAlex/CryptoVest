//
//  CryptoCoinTableViewCell.swift
//  CryptoVest
//
//  Created by Alexandr Mefisto on 06.08.2022.
//

import UIKit

final class CryptoCoinTableViewCell: UITableViewCell {
    @IBOutlet var changeView: UIView!
    @IBOutlet private var coinImage: UIImageView!
    @IBOutlet private var coinIDLabel: UILabel!
    @IBOutlet private var coinName: UILabel!
    @IBOutlet private var changeLabel: UILabel!
    @IBOutlet private var changeArrowImage: UIImageView!
    @IBOutlet private var priceLabel: UILabel!
}

extension CryptoCoinTableViewCell {
    func setCoin(coin: Coin) {
        var arrowImage: UIImage
        coinImage.image = UIImage(named: coin.coinID)
        coinIDLabel.text = coin.coinID
        coinName.text = coin.name
        if coin.change >= 0 {
            changeView.setGradientBackground(colorTop: UIColor(named: "GreenFrom")!, colorBottom: UIColor(named: "GreenTo")!)
            arrowImage = UIImage(named: "ArrowUp")!
        } else {
            changeView.setGradientBackground(colorTop: UIColor(named: "RedFrom")!, colorBottom: UIColor(named: "RedTo")!)
            arrowImage = UIImage(named: "ArrowDown")!
        }
        changeArrowImage.image = arrowImage
        changeLabel.text = "\(abs(coin.change))%"
        changeView.setCornerRadius()
        
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        formatter.maximumFractionDigits = 2
        formatter.currencyDecimalSeparator = ","

        priceLabel.text = "$" + formatter.string(from: NSNumber(value: coin.price))!
    }
}

extension UIView {
    public func setCornerRadius() {
        layer.cornerRadius = bounds.width / 8
        layer.masksToBounds = true
    }
}
