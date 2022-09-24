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
    private let globalScheduler = ConcurrentDispatchQueueScheduler(queue: DispatchQueue.global())
    
    var coinListDriver: Driver<[CoinStat]> {
        return coinListSubject.asDriver(onErrorJustReturn: [])
    }
    
    private let coinListApi: CoinsApi
    
    init(coinListApi: CoinsApi) {
        self.coinListApi = coinListApi
        load()
    }
    
    func load() {
        let intervalUpdate = Observable<Int>
            .interval(.seconds(5), scheduler: globalScheduler)
            .flatMap { [unowned self] _ in
                coinListApi.getCoinsUpdate().asObservable()
            }
        
        coinListApi
            .getCoins()
            .asObservable()
            .flatMap { coins in
                return Observable.combineLatest(
                    Observable.just(coins),
                    intervalUpdate.startWith([])
                )
            }
            .observe(on: globalScheduler)
            .map { (coins, coinUpdates) -> [CoinStat] in
                coins.map { coin in
                    let coinUpdate = coinUpdates.first(where: { $0.identifier == coin.identifier })
                    
                    return CoinStat(
                        identifier: coin.identifier,
                        rank: coinUpdate?.rank ?? coin.rank,
                        usdPrice: coinUpdate?.usdPrice ?? coin.usdPrice ?? 0,
                        btcPrice: coinUpdate?.btcPrice ?? coin.btcPrice ?? 0,
                        usdDayVolume: coinUpdate?.usdDayVolume ?? coin.usdDayVolume ?? 0,
                        name: coin.name,
                        symbol: coin.symbol,
                        iconUrl: coin.iconUrl,
                        marketCapUsd: coinUpdate?.marketCapUsd ?? coin.marketCapUsd ?? 0,
                        hourPercentChange: coinUpdate?.hourPercentChange ?? coin.hourPercentChange ?? 0,
                        dayPercentChange: coinUpdate?.dayPercentChange ?? coin.dayPercentChange ?? 0,
                        weekPercentChange: coinUpdate?.weekPercentChange ?? coin.weekPercentChange ?? 0
                    )
                }
            }
            .subscribe(onNext: coinListSubject.onNext)
            .disposed(by: disposeBag)
    }
}
