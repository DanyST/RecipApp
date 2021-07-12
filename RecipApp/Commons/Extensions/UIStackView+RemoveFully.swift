//
//  UIStackView+RemoveFully.swift
//  RecipApp
//
//  Created by Luis Herrera Lillo on 12-07-21.
//

import UIKit

extension UIStackView {
    
    func removeFully(view: UIView) {
        removeArrangedSubview(view)
        view.removeFromSuperview()
    }
    
    func removeFullyAllArrangedSubviews() {
        arrangedSubviews.forEach { (view) in
            removeFully(view: view)
        }
    }
}
