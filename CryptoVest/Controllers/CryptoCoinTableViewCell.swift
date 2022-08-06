//
//  CryptoCoinTableViewCell.swift
//  CryptoVest
//
//  Created by Alexandr Mefisto on 06.08.2022.
//

import UIKit

final class CryptoCoinTableViewCell: UITableViewCell {
   
    @IBOutlet private var coinImage: UIImageView!
    @IBOutlet private var coinIDLabel: UILabel!
    @IBOutlet private var coinName: UILabel!
    @IBOutlet private var changeLabel: UILabel!
    @IBOutlet private var changeView: UIView!
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
            changeView.backgroundColor = .systemGreen
            arrowImage = UIImage(named: "ArrowUp")!
            arrowImage = arrowImage.withTintColor(.green)
        } else {
            changeView.backgroundColor = .red
            arrowImage = UIImage(named: "ArrowDown")!
            arrowImage = arrowImage.withTintColor(.red)
        }
        changeView.magicallySetCornerRadius()
        changeArrowImage.image = arrowImage
        changeLabel.text = "   \(abs(coin.change))%  "
        priceLabel.text = "$\(coin.price)"
    
    }
}

extension UIView {
    /**
     Magically computes and sets an ideal corner radius.
     */
    public func magicallySetCornerRadius() {
        layer.cornerRadius = 0.188 * min(frame.width, frame.height)
        layer.masksToBounds = true
    }
}
