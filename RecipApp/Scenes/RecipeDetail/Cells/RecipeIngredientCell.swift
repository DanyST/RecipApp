//
//  RecipeIngredientCell.swift
//  RecipApp
//
//  Created by Luis Herrera Lillo on 12-07-21.
//

import UIKit

final class RecipeIngredientCell: UITableViewCell, ReusableView {
    
    // MARK: - Properties
    private let titleLabel: UILabel = {
        let label = UILabel.customTitleLabel
        label.text = "Ingredients".localized
        return label
    }()
    
    private var ingredientsStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.spacing = 16
        stackView.axis = .vertical
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
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

// MARK: - Setup UI
private extension RecipeIngredientCell {
    func setupUI() {
        contentView.backgroundColor = .systemBackground
        setupConstraints()
    }
    
    func setupConstraints() {
        contentView.addSubview(titleLabel)
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 16),
            titleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            titleLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
        ])
        
        contentView.addSubview(ingredientsStackView)
        NSLayoutConstraint.activate([
            ingredientsStackView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 16),
            ingredientsStackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            ingredientsStackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            ingredientsStackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -16)
        ])
    }
}

// MARK: - Sync UI
extension RecipeIngredientCell {
    func setup(withIngredients ingredients: [String]) {
        ingredientsStackView.removeFullyAllArrangedSubviews()
        
        ingredients.forEach { ingredient in
            let ingredient = createIngredientView(with: ingredient)
            ingredientsStackView.addArrangedSubview(ingredient)
        }
    }

    private func createIngredientView(with ingredient:  String) -> UIStackView {
        let ingredientlabel = UILabel()
        ingredientlabel.textColor = .label
        ingredientlabel.text = ingredient
        ingredientlabel.setContentCompressionResistancePriority(.defaultHigh + 10, for: .vertical)
        
        let iconImageView = UIImageView(image: UIImage(systemName: "drop.fill"))
        iconImageView.tintColor = .green
               
        let stackView = UIStackView(arrangedSubviews: [iconImageView, ingredientlabel])
        stackView.axis = .horizontal
        stackView.alignment = .fill
        stackView.distribution = .fillProportionally
        stackView.spacing = 8
        
        NSLayoutConstraint.activate([
            iconImageView.heightAnchor.constraint(equalToConstant: 22),
            iconImageView.widthAnchor.constraint(equalToConstant: 18),
        ])
                       
        return stackView
    }
}
