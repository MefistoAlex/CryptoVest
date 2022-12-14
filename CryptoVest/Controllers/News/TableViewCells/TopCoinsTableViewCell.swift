//
//  TopCoinsTableViewCell.swift
//  CryptoVest
//
//  Created by Alexandr Mefisto on 12.08.2022.
//

import UIKit

class TopCoinsTableViewCell: UITableViewCell {
    private var coinsCount = 3

    @IBOutlet var changeValues: [UILabel]!
    @IBOutlet var changeViews: [UIView]!
    @IBOutlet var arrows: [UIImageView]!
    @IBOutlet var prices: [UILabel]!
    @IBOutlet var coinsIDs: [UILabel]!
}

extension TopCoinsTableViewCell {
    func setCoins(coins: [Coin]) {
        var arrowImage: UIImage?
        coinsCount = coins.count <= coinsCount ? coins.count : coinsCount

        for index in 0 ..< coinsCount {
            coinsIDs[index].text = coins[index].symbol

            if coins[index].change >= 0 {
                changeViews[index].setGradientBackground(
                    colorTop: UIColor(named: CustomColors.greenFrom.rawValue),
                    colorBottom: UIColor(named: CustomColors.greenTo.rawValue)
                )
                arrowImage = UIImage(named: CustomImages.arrowUp.rawValue)
            } else {
                changeViews[index].setGradientBackground(
                    colorTop: UIColor(named: CustomColors.redFrom.rawValue),
                    colorBottom: UIColor(named: CustomColors.redTo.rawValue))
                arrowImage = UIImage(named: CustomImages.arrowDown.rawValue)
            }
            changeViews[index].layer.cornerRadius = changeViews[index].bounds.height / 2
            changeViews[index].layer.masksToBounds = true
            arrows[index].image = arrowImage
            changeValues[index].text = " " + String(format: "%.2f", abs(coins[index].change)) + "%  "

            let formatter = NumberFormatter()
            formatter.numberStyle = .decimal
            formatter.maximumFractionDigits = 2
            formatter.currencyDecimalSeparator = ","

            prices[index].text = "$" + formatter.string(from: NSNumber(value: coins[index].price))!
        }
    }
}
