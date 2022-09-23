//
//  UITableViewCell+identifier.swift
//  CoinList
//
//  Created by Grigory Belousov on 23.09.2022.
//

import Foundation
import UIKit

extension UITableViewCell {
    static var identifier: String {
        String(describing: Self.self)
    }
}
