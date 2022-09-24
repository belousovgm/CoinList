//
//  CoinStat.swift
//  Coin List
//
//  Created by Grigory Belousov on 23.09.2022.
//

import Foundation

struct CoinStat: Equatable {
    let identifier: String
    let rank: Int
    let usdPrice: Double
    let btcPrice: Double
    let usdDayVolume: Double
    let name: String
    let symbol: String
    let iconUrl: String
    let marketCapUsd: Int
    let hourPercentChange: Double
    let dayPercentChange: Double
    let weekPercentChange: Double
}
