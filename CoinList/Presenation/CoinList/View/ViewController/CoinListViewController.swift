//
//  CoinListViewController.swift
//  Coin List
//
//  Created by Grigory Belousov on 20.09.2022.
//

import UIKit
import RxSwift
import RxDataSources

class CoinListViewController: UIViewController {
    @IBOutlet private weak var tableView: UITableView!
    @IBOutlet private weak var navigationBarView: CoinListNavigationBarView!
    
    @IBOutlet private weak var coinLabel: UILabel!
    @IBOutlet private weak var dayLabel: UILabel!
    @IBOutlet private weak var priceLabel: UILabel!
    
    private let viewModel: CoinListViewModel
    private let dataSource: CoinListDataSource
    
    private let disposeBag = DisposeBag()
    
    init(viewModel: CoinListViewModel, dataSource: CoinListDataSource) {
        self.viewModel = viewModel
        self.dataSource = dataSource
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.register(UINib(nibName: CoinTableViewCell.identifier, bundle: nil), forCellReuseIdentifier: CoinTableViewCell.identifier)
        tableView.rx.setDelegate(self).disposed(by: disposeBag)
        
        navigationBarView
            .searchText
            .compactMap { $0 }
            .bind(to: viewModel.searchTextSubject)
            .disposed(by: disposeBag)
        
        viewModel
            .coinListDriver
            .asObservable()
            .map { coinsStat in
                [SectionModel(model: "", items: coinsStat)]
            }
            .bind(to: tableView.rx.items(dataSource: dataSource))
            .disposed(by: disposeBag)
        
        coinLabel.text = R.string.localizable.coinListCoinTitle()
        dayLabel.text = R.string.localizable.coinList24hTitle()
        priceLabel.text = R.string.localizable.coinListPriceTitle()
    }
}

extension CoinListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 57
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return 57
    }
}
