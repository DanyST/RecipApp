//
//  RecipeDescriptionCell.swift
//  RecipApp
//
//  Created by Luis Herrera Lillo on 11-07-21.
//

import UIKit

final class RecipeDescriptionCell: UITableViewCell, ReusableView {
    
    // MARK: - Properties
    private let titleLabel: UILabel = {
        let label = UILabel.customTitleLabel
        label.text = "Description".localized
        return label
    }()
    
    private let detailLabel: UILabel = {
        let label = UILabel.customSecondaryLabel
        label.numberOfLines = 0
        return label
    }()
    
    // MARK: - Initialization
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}


// MARK: - Setup UI methods
private extension RecipeDescriptionCell {
    func setupUI() {
        contentView.backgroundColor = .systemBackground
        setupConstraints()
    }
    
    func setupConstraints() {
        contentView.addSubview(titleLabel)
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 16),
            titleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            titleLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16)
        ])
        titleLabel.setContentHuggingPriority(.defaultLow - 1, for: .vertical)
        
        contentView.addSubview(detailLabel)
        NSLayoutConstraint.activate([
            detailLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 16),
            detailLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            detailLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            detailLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -16)
        ])
    }
}

extension RecipeDescriptionCell {
    func setup(description: String) {
        detailLabel.text = description
    }
}
