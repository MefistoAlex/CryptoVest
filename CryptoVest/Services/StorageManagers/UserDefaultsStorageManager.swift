//
//  UserDefaultsStorageManager.swift
//  CryptoVest
//
//  Created by Alexandr Mefisto on 23.08.2022.
//

import Foundation
class UserDefaultsStorageManager: StorageManager {
    private let key = "favourites"
    func saveCoin(coin: Coin) {
        var favourites = getFavouriteCoins()
        favourites.insert(coin.id)
        setFavouriteCoins(coinsIdSet: favourites)
    }

    func removeCoin(coin: Coin) {
        var favourites = getFavouriteCoins()
        favourites.remove(coin.id)
        setFavouriteCoins(coinsIdSet: favourites)
    }

    func setFavouriteCoins(coinsIdSet: Set<Int>) {
        UserDefaults.standard.set(Array(coinsIdSet), forKey: key)
    }

    func getFavouriteCoins() -> Set<Int> {
        if let favouritesCoins = UserDefaults.standard.object(forKey: key) as? [Int] {
            return Set(favouritesCoins)
        } else {
            return Set<Int>()
        }
    }
}
