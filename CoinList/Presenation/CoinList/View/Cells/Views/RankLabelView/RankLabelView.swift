//
//  RankLabelView.swift
//  CoinList
//
//  Created by Grigory Belousov on 23.09.2022.
//

import UIKit

class RankLabelView: NibView {
    @IBOutlet private weak var label: UILabel!
    
    var text: String? {
        didSet {
            label.text = text
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        layer.cornerRadius = 4
    }
}
