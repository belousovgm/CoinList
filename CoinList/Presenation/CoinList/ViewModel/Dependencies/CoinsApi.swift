//
//  CoinListApi.swift
//  Coin List
//
//  Created by Grigory Belousov on 23.09.2022.
//

import Foundation
import RxSwift

protocol CoinsApi {
    func getCoins() -> Single<[Coin]>
    func getCoinsUpdate() -> Single<[CoinUpdate]>
}
