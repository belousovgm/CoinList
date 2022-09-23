//
//  CoinStatsApi.swift
//  Coin List
//
//  Created by Grigory Belousov on 23.09.2022.
//

import Foundation
import RxAlamofire
import RxSwift

class CoinStatsApi {
    private let baseUrl = "https://api.coin-stats.com/v3"
    
    func getCoinStats() -> Single<[CoinStatResponse]> {
        RxAlamofire
            .requestDecodable(.get, baseUrl + "/coins")
            .map { (_, decodable: [CoinStatResponse]) in
                return decodable
            }.asSingle()
    }
}
