//
//  AppDelegate+container.swift
//  Coin List
//
//  Created by Grigory Belousov on 23.09.2022.
//

import Foundation
import Swinject

let container = Container() { container in
    container.register(CoinListApi.self) { _ in CoinStatsApi() }
    
    container.register(CoinListViewModel.self) { resolver in
        CoinListViewModel(coinListApi: resolver.resolve(CoinListApi.self)!)
    }
    
    container.register(CoinListViewController.self) { resolver in
        return CoinListViewController(viewModel: resolver.resolve(CoinListViewModel.self)!)
    }
}
