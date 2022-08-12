//
//  Extensions.swift
//  CryptoVest
//
//  Created by Alexandr Mefisto on 11.08.2022.
//

import UIKit
enum CustomColors: String {
    case mainFrom = "MainFrom"
    case mainTo = "MainTo"
    case greenFrom = "GreenFrom"
    case greenTo = "GreenTo"
    case redFrom = "RedFrom"
    case redTo = "RedTo"
}

enum CustomImages: String {
    case logo
    case arrowUp = "ArrowUp"
    case arrowDown = "ArrowDown"
}

extension UIViewController {
    func setHeader() {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.image = UIImage(named: CustomImages.logo.rawValue)
        navigationItem.titleView = imageView

        let colorFrom = UIColor(named: CustomColors.mainFrom.rawValue)
        let colorTo = UIColor(named: CustomColors.mainTo.rawValue)
        view.setGradientBackground(colorTop: colorFrom, colorBottom: colorTo)

        // making header without blur
        navigationController?.navigationBar.standardAppearance.configureWithTransparentBackground()
    }
}

extension UIView {
    func setGradientBackground(colorTop: UIColor?, colorBottom: UIColor?) {
        guard let colorTop = colorTop, let colorBottom = colorBottom else { return }

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
