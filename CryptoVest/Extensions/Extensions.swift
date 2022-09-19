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
    case shareLink
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
    // TODO: fix gradient Bug

    func setGradientBackground(colorTop: UIColor?, colorBottom: UIColor?) {
        guard let colorTop = colorTop, let colorBottom = colorBottom else { return }

        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = [colorTop.cgColor, colorBottom.cgColor]
        gradientLayer.startPoint = CGPoint(x: 0.0, y: 0.5)
        gradientLayer.endPoint = CGPoint(x: 1.0, y: 0.5)
        gradientLayer.frame = bounds
        gradientLayer.frame.size.width += 10
        let count = UInt32(layer.sublayers?.count ?? 0)
        layer.insertSublayer(gradientLayer, at: count - 1)
    }
}

extension UIViewController {
    func getViewController(viewStoryboardID: String) -> UIViewController {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let controller = storyboard.instantiateViewController(withIdentifier: viewStoryboardID)
        return controller
    }
    func showNotifications(){
        let articleViewController = getViewController(viewStoryboardID: "NotificationViewController") as! NotificationViewController
        present(articleViewController, animated: true)
    }
}
