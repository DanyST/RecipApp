//
//  UILabel+Custom.swift
//  RecipApp
//
//  Created by Luis Herrera Lillo on 12-07-21.
//

import UIKit

extension UILabel {
    static var customTitleLabel: UILabel {
        let label = UILabel()
        label.textColor = .label
        label.font = .systemFont(ofSize: 22, weight: .bold)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }
    
    static var customSubTitleLabel: UILabel {
        let label = UILabel.customTitleLabel
        label.font = .systemFont(ofSize: 18, weight: .bold)
        return label
    }
    
    static var customSecondaryLabel: UILabel {
        let label = UILabel()
        label.textColor = .secondaryLabel
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }
}
