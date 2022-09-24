//
//  CoinResponse.swift
//  Coin List
//
//  Created by Grigory Belousov on 23.09.2022.
//

import Foundation

struct CoinsResponse: Decodable {
    let coins: [Coin]
}
