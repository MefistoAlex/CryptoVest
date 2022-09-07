//
//  UserDefaultsStorageManager.swift
//  CryptoVest
//
//  Created by Alexandr Mefisto on 23.08.2022.
//

import Foundation
class UserDefaultsStorageManager: StorageManager {
    func setFavouriteCoins(coinsIdSet: Set<Int>) {
        UserDefaults.standard.set(Array(coinsIdSet), forKey: "favourites")
    }

    func getFavouriteCoins() -> Set<Int> {
        if let favouritesCoins = UserDefaults.standard.object(forKey: "favourites") as? [Int] {
            return Set(favouritesCoins)
        } else {
            return Set<Int>()
        }
    }
}
