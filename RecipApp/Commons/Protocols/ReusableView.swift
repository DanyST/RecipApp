//
//  ReusableView.swift
//  RecipApp
//
//  Created by Luis Herrera Lillo on 12-07-21.
//

import UIKit

protocol ReusableView: AnyObject {
    static var reuseIdentifier: String { get }
}

extension ReusableView where Self: UIView {
    static var reuseIdentifier: String {
        return String(describing: self)
    }
}
