//
//  PercentChangeView.swift
//  CoinList
//
//  Created by Grigory Belousov on 23.09.2022.
//

import UIKit

class PercentChangeView: NibView {
    @IBOutlet private var valueLabel: UILabel!
    @IBOutlet private var arrowImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        layer.cornerRadius = 8
    }

    func setup(value: Double) {
        valueLabel.text = R.string.localizable.coinListPercentChangeText(abs(value))
        
        if value < 0 {
            arrowImageView.image = R.image.rateFallArrow()
            backgroundColor = R.color.rateFallLabelBackground()
            valueLabel.textColor = R.color.rateFallLabelText()
        } else {
            arrowImageView.image = R.image.rateGrowthArrow()
            backgroundColor = R.color.rateGrowthLabelBackground()
            valueLabel.textColor = R.color.rateGrowthLabelText()
        }
    }
}
