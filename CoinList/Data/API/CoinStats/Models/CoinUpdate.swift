//
//  CoinUpdate.swift
//  CoinList
//
//  Created by Grigory Belousov on 24.09.2022.
//

import Foundation

struct CoinUpdate: Decodable {
    let identifier: String
    let rank: Int
    let usdPrice: Double?
    let btcPrice: Double?
    let usdDayVolume: Double?
    let marketCapUsd: Int?
    let hourPercentChange: Double?
    let dayPercentChange: Double?
    let weekPercentChange: Double?
}
