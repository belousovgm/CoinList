//
//  CoinListDataSource.swift
//  CoinList
//
//  Created by Grigory Belousov on 23.09.2022.
//

import Foundation
import RxDataSources

typealias CoinListDataSource = RxTableViewSectionedReloadDataSource<SectionModel<String, CoinStat>>
struct CoinListDataSourceProvider {
    let dataSource = CoinListDataSource(configureCell: { _, tableView, indexPath, coinStat in
        let cell = tableView.dequeueReusableCell(withIdentifier: CoinTableViewCell.identifier, for: indexPath) as! CoinTableViewCell
        let cellData = CoinTableViewCell.CellData(
            rank: coinStat.rank,
            usdPrice: coinStat.usdPrice,
            usdDayVolume: coinStat.usdDayVolume,
            name: coinStat.name,
            iconUrl: coinStat.iconUrl,
            dayPercentChange: coinStat.dayPercentChange,
            sybmol: coinStat.symbol
        )
        
        cell.fill(with: cellData)
        
        return cell
    })
}

extension CoinStat: IdentifiableType {
    typealias Identity = String
    
    var identity: Identity {
        return identifier
    }
}
