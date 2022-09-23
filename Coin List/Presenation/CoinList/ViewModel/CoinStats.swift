//
//  CoinStats.swift
//  Coin List
//
//  Created by Grigory Belousov on 23.09.2022.
//

import Foundation

struct CoinStat {
    let identifier: String
    let rank: String
    let usdPrice: Int
    let btcPrice: Int
    let usdDayVolume: Int
    let name: String
    let symbol: String
    let iconUrl: String
    let marketCapUsd: Int
    let hourPercentChange: Double
    let dayPercentChange: Double
    let weekPercentChange: Double
}
