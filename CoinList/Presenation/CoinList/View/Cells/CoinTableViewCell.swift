//
//  CoinTableViewCell.swift
//  Coin List
//
//  Created by Grigory Belousov on 23.09.2022.
//

import UIKit
import AlamofireImage

class CoinTableViewCell: UITableViewCell {
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var iconImageView: UIImageView!
    @IBOutlet weak var rankLabelView: RankLabelView!
    @IBOutlet weak var abbreviationLabel: UILabel!
    @IBOutlet weak var percentChangeView: PercentChangeView!
    @IBOutlet weak var priceLabel: UILabel!
    
    struct CellData {
        let rank: Int
        let usdPrice: Double
        let usdDayVolume: Double
        let name: String
        let iconUrl: String
        let dayPercentChange: Double
        let sybmol: String
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        
        iconImageView.af.cancelImageRequest()
        imageView?.image = nil
    }
    
    func fill(with data: CellData) {
        nameLabel.text = data.name
        rankLabelView.text = "\(data.rank)"
        abbreviationLabel.text = data.sybmol
        percentChangeView.setup(value: data.dayPercentChange)
        priceLabel.text = data.usdPrice.currencyUS
        
        if let url = URL(string: data.iconUrl) {
            iconImageView.af.setImage(
                withURL: url
            )
        }
    }
}
