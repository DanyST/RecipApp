//
//  String+Localization.swift
//  RecipApp
//
//  Created by Luis Herrera Lillo on 10-07-21.
//

import Foundation

extension String {
    var localized: String {
        return NSLocalizedString(self, comment: "")
    }
}
