//
//  StorageManager.swift
//  CryptoVest
//
//  Created by Alexandr Mefisto on 23.08.2022.
//

import Foundation
protocol StorageManager {
    func setFavouriteCoins(coinsIdSet: Set<Int>)
    func getFavouriteCoins() -> Set<Int>
}

