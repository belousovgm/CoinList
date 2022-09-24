//
//  CoinListNavigationBarView.swift
//  CoinList
//
//  Created by Grigory Belousov on 24.09.2022.
//

import UIKit
import RxSwift

class CoinListNavigationBarView: NibView {
    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var currencyLabel: UILabel!
    @IBOutlet private weak var searchButton: UIButton!
    @IBOutlet private weak var mainView: UIView!
    @IBOutlet private weak var searchBar: UISearchBar!
    @IBOutlet private weak var searchBarWidthConstraint: NSLayoutConstraint!
    
    private let disposeBag = DisposeBag()
    
    lazy var searchText = searchBar.rx.text
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        setupSearchBar()
        
        titleLabel.text = R.string.localizable.coinListTitle()
        currencyLabel.text = R.string.localizable.coinListCurrencyUsd()
        
        searchButton.rx.tap.subscribe(onNext: showSearchBar).disposed(by: disposeBag)
        searchBar.rx.cancelButtonClicked.subscribe(onNext: hideSearchBar).disposed(by: disposeBag)
    }
    
    private func setupSearchBar() {
        searchBar.searchBarStyle = UISearchBar.Style.default
        searchBar.placeholder = R.string.localizable.coinListSearchBarPlaceholder()
        searchBar.sizeToFit()
        searchBar.isTranslucent = false
        searchBar.backgroundColor = .clear
        searchBar.backgroundImage = UIImage()
        searchBar.showsCancelButton = true
        searchBar.alpha = 0

        searchBarWidthConstraint.constant = 0
    }

    private func showSearchBar() {
        searchBar.becomeFirstResponder()

        UIView.animate(
            withDuration: 0.3,
            delay: 0,
            usingSpringWithDamping: 0.8,
            initialSpringVelocity: 0.3,
            animations: ({
                self.searchBar.alpha = 1
                self.mainView.alpha = 0
                self.searchBarWidthConstraint.constant = self.bounds.width
                self.layoutIfNeeded()
            })
        )
    }

    private func hideSearchBar() {
        UIView.animate(
            withDuration: 0.5,
            delay: 0,
            usingSpringWithDamping: 0.85,
            initialSpringVelocity: 0.5,
            animations: ({
                self.searchBarWidthConstraint.constant = 0
                self.mainView.alpha = 1
                self.searchBar.alpha = 0
                self.layoutIfNeeded()
            }),
            completion: ({ _ in
                self.searchBar.text = nil
                self.searchBar.resignFirstResponder()
            })
        )
    }

}
