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
    }
    
    func fill(with data: CellData) {
        nameLabel.text = data.name
        rankLabelView.text = "\(data.rank)"
        abbreviationLabel.text = data.sybmol
        percentChangeView.setup(value: data.dayPercentChange)
        priceLabel.text = "\(data.usdPrice)"
        
        if let url = URL(string: data.iconUrl) {
            iconImageView.af.setImage(
                withURL: url
                //            cacheKey: <#T##String?#>,
                //            placeholderImage: <#T##UIImage?#>,
                //            serializer: <#T##ImageResponseSerializer?#>,
                //            filter: <#T##ImageFilter?#>,
                //            progress: <#T##ImageDownloader.ProgressHandler?##ImageDownloader.ProgressHandler?##(Progress) -> Void#>,
                //            progressQueue: <#T##DispatchQueue#>,
                //            imageTransition: <#T##UIImageView.ImageTransition#>,
                //            runImageTransitionIfCached: <#T##Bool#>,
                //            completion: <#T##((AFIDataResponse<UIImage>) -> Void)?##((AFIDataResponse<UIImage>) -> Void)?##(AFIDataResponse<UIImage>) -> Void#>
            )
        }
    }
}
