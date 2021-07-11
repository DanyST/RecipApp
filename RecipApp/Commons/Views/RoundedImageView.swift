//
//  RoundedImageView.swift
//  RecipApp
//
//  Created by Luis Herrera Lillo on 10-07-21.
//

import UIKit

final class RoundedImageView: UIImageView {
    
    enum RoundedType: CGFloat {
        case circle = 2
        case rounded = 8
    }
        
    // MARK: - Properties
    var roundedType: RoundedType
    
    // MARK: - Initialization
    init(image: UIImage? = nil, roundedType: RoundedType = .circle) {
        self.roundedType = roundedType
        super.init(image: image)
    }
       
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Life Cycle
    override func layoutSubviews() {
        super.layoutSubviews()
        self.layer.cornerRadius = self.bounds.size.width / roundedType.rawValue
        self.clipsToBounds = true
    }
}
