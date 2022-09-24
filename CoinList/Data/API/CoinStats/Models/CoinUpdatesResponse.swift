//
//  CoinUpdateResponse.swift
//  CoinList
//
//  Created by Grigory Belousov on 24.09.2022.
//

import Foundation

struct CoinUpdatesResponse: Decodable {
    let coinUpdates: [CoinUpdate]
    
    enum CodingKeys: String, CodingKey {
        case coinUpdates = "coins"
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        let coins: [Any] = try container.decode([Any].self, forKey: .coinUpdates)
        
        coinUpdates = try coins.map { values -> CoinUpdate in
            guard let values = values as? [Any] else {
                throw DecodingError.valueNotFound([Any].self, .init(codingPath: [CodingKeys.coinUpdates], debugDescription: "Value is not an Array"))
            }

            return CoinUpdate(
                identifier: values[0] as! String,
                rank: values[1] as! Int,
                usdPrice: values[2] as? Double,
                btcPrice: values[3] as? Double,
                usdDayVolume: values[4] as? Double,
                marketCapUsd: values[5] as? Int,
                hourPercentChange: values[6] as? Double,
                dayPercentChange: values[7] as? Double,
                weekPercentChange: values[8] as? Double
            )
        }
    }
}
