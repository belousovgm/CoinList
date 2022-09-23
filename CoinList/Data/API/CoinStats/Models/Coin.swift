//
//  Coin.swift
//  CoinList
//
//  Created by Grigory Belousov on 24.09.2022.
//

import Foundation

struct Coin: Decodable {
    let identifier: String
    let rank: Int
    let usdPrice: Double?
    let btcPrice: Double?
    let usdDayVolume: Double?
    let name: String
    let symbol: String
    let iconUrl: String
    let marketCapUsd: Int?
    let hourPercentChange: Double?
    let dayPercentChange: Double?
    let weekPercentChange: Double?

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
