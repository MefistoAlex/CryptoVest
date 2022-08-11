//
//  Extensions.swift
//  CryptoVest
//
//  Created by Alexandr Mefisto on 11.08.2022.
//

import UIKit

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
