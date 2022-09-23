//
//  CoinStatMapper.swift
//  Coin List
//
//  Created by Grigory Belousov on 23.09.2022.
//

import Foundation
import RxSwift

extension CoinStatResponse {
    func asCoinStat() -> CoinStat {
        return CoinStat(
            identifier: identifier,
            rank: rank,
            usdPrice: usdPrice,
            btcPrice: btcPrice,
            usdDayVolume: usdDayVolume,
            name: name,
            symbol: symbol,
            iconUrl: iconUrl,
            marketCapUsd: marketCapUsd,
            hourPercentChange: hourPercentChange,
            dayPercentChange: dayPercentChange,
            weekPercentChange: weekPercentChange
        )
    }
}

extension CoinStatsApi: CoinListApi {
    func getCoinStats() -> Single<[CoinStat]> {
        getCoinStats().map { coinStatResponse in
            return coinStatResponse.map { $0.asCoinStat() }
        }
    }
}
