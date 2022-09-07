//
//  CryptoCoinTableViewCell.swift
//  CryptoVest
//
//  Created by Alexandr Mefisto on 06.08.2022.
//

import SDWebImage
import UIKit

final class CryptoCoinTableViewCell: UITableViewCell {
    @IBOutlet private var changeView: UIView!
    @IBOutlet private var coinImage: UIImageView!
    @IBOutlet private var coinIDLabel: UILabel!
    @IBOutlet private var coinName: UILabel!
    @IBOutlet private var changeLabel: UILabel!
    @IBOutlet private var changeArrowImage: UIImageView!
    @IBOutlet private var priceLabel: UILabel!
    @IBOutlet var isFauvoriteImageView: UIImageView!
}

extension CryptoCoinTableViewCell {
    func setCoin(coin: Coin) {
        var arrowImage: UIImage?

        if let logoURL = coin.logo {
            coinImage.sd_setImage(with: URL(string: logoURL))
        }

        coinIDLabel.text = coin.symbol
        coinName.text = coin.name

        if coin.change >= 0 {
            changeView.setGradientBackground(
                colorTop: UIColor(named: CustomColors.greenFrom.rawValue),
                colorBottom: UIColor(named: CustomColors.greenTo.rawValue)
            )
            arrowImage = UIImage(named: CustomImages.arrowUp.rawValue)
        } else {
            changeView.setGradientBackground(
                colorTop: UIColor(named: CustomColors.redFrom.rawValue),
                colorBottom: UIColor(named: CustomColors.redTo.rawValue))
            arrowImage = UIImage(named: CustomImages.arrowDown.rawValue)
        }

        changeArrowImage.image = arrowImage

        changeLabel.text = String(format: "%.2f", abs(coin.change)) + "%"
        changeView.setCornerRadius()

        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        formatter.maximumFractionDigits = 2
        formatter.currencyDecimalSeparator = ","

        if coin.price > 1 {
            priceLabel.text = "$ \(String(format: "%.2f", coin.price))"
        } else if coin.price > 0.001 {
            priceLabel.text = "$ \(String(format: "%.3f", coin.price))"
        } else {
            priceLabel.text = "$ \(String(format: "%.5f", coin.price))"
        }
        isFauvoriteImageView.isHidden = !coin.isFavouriteNonOptional
    }
}

private extension UIView {
    func setCornerRadius() {
        layer.cornerRadius = bounds.width / 8
        layer.masksToBounds = true
    }
}
