//
//  CoinListViewModel.swift
//  Coin List
//
//  Created by Grigory Belousov on 23.09.2022.
//

import Foundation
import RxSwift
import RxCocoa

class CoinListViewModel {
    private let disposeBag = DisposeBag()
    private let coinListSubject = PublishSubject<[CoinStat]>()
    
    var coinListDriver: Driver<[CoinStat]> {
        return coinListSubject.asDriver(onErrorJustReturn: [])
    }
    
    private let coinListApi: CoinsApi
    
    init(coinListApi: CoinsApi) {
        self.coinListApi = coinListApi
        load()
    }
    
    func load() {
//        RxTimeInterval
        coinListApi
            .getCoins()
            .map({ coins in
                coins.map { $0.asCoinStats() }
            })
            .subscribe(onSuccess: coinListSubject.onNext)
            .disposed(by: disposeBag)
    }
}

extension Coin {
    func asCoinStats() -> CoinStat {
        CoinStat(
            identifier: identifier,
            rank: rank,
            usdPrice: usdPrice ?? 0,
            btcPrice: btcPrice ?? 0,
            usdDayVolume: usdDayVolume ?? 0,
            name: name,
            symbol: symbol,
            iconUrl: iconUrl,
            marketCapUsd: marketCapUsd ?? 0,
            hourPercentChange: hourPercentChange ?? 0,
            dayPercentChange: dayPercentChange ?? 0,
            weekPercentChange: weekPercentChange ?? 0
        )
        
    }
}
