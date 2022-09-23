//
//  CoinStatsResponse.swift
//  Coin List
//
//  Created by Grigory Belousov on 23.09.2022.
//

import Foundation

struct CoinStatResponse: Decodable {
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

    enum CodingKeys: String, CodingKey {
        case identifier = "i"
        case rank = "r"
        case usdPrice = "pu"
        case btcPrice = "pb"
        case usdDayVolume = "v"
        case name = "n"
        case symbol = "s"
        case iconUrl = "ic"
        case marketCapUsd = "m"
        case hourPercentChange = "p1"
        case dayPercentChange = "p24"
        case weekPercentChange = "p7"
    }
}
