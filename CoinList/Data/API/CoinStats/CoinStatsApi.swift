//
//  CoinStatsApi.swift
//  Coin List
//
//  Created by Grigory Belousov on 23.09.2022.
//

import Foundation
import RxAlamofire
import RxSwift

class CoinStatsApi: CoinsApi {
    private let baseUrl = "https://api.coin-stats.com/v3"
    
    func getCoins() -> Single<[Coin]> {
        RxAlamofire
            .requestDecodable(.get, baseUrl + "/coins")
            .map { (_, coinsResponse: CoinsResponse) in
                return coinsResponse.coins
            }.asSingle()
    }
    
    func getCoinsUpdate() -> Single<[CoinUpdate]> {
        RxAlamofire
            .requestDecodable(.get, baseUrl + "/coins", parameters: ["responseType": "array"])
            .map { (_, coinUpdatesResponse: CoinUpdatesResponse) in
                return coinUpdatesResponse.coinUpdates
            }.asSingle()
    }
}
