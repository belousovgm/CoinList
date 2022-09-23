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
    
    private let coinListApi: CoinListApi
    
    init(coinListApi: CoinListApi) {
        self.coinListApi = coinListApi
    }
    
    func load() {
        coinListApi
            .getCoinStats()
            .subscribe(onSuccess: coinListSubject.onNext)
            .disposed(by: disposeBag)
    }
}
