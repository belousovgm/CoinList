//
//  AppDelegate+container.swift
//  Coin List
//
//  Created by Grigory Belousov on 23.09.2022.
//

import Foundation
import Swinject

let container = Container() { container in
    container.register(CoinsApi.self) { _ in CoinStatsApi() }
    
    container.register(CoinListViewModel.self) { resolver in
        CoinListViewModel(coinListApi: resolver.resolve(CoinsApi.self)!)
    }
    
    container.register(CoinListDataSource.self) { resolver in
        return CoinListDataSourceProvider().dataSource
    }
    
    container.register(CoinListViewController.self) { resolver in
        return CoinListViewController(
            viewModel: resolver.resolve(CoinListViewModel.self)!,
            dataSource: resolver.resolve(CoinListDataSource.self)!
        )
    }
}
