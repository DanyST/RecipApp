//
//  RecipeDetailHeaderView.swift
//  RecipApp
//
//  Created by Luis Herrera Lillo on 10-07-21.
//

import UIKit

class RecipeDetailHeaderCell: UITableViewCell, ReusableView  {
    
    // MARK: - Properties   
    private let recipeImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let blurView: UIVisualEffectView = {
        let blurEffect = UIBlurEffect(style: .dark)
        let blurEffectView = UIVisualEffectView(effect: blurEffect)
        blurEffectView.translatesAutoresizingMaskIntoConstraints = false
        return blurEffectView
    }()
    
    private let backButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(UIImage(systemName: "chevron.left"), for: .normal)
        button.tintColor = .white
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
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
private extension RecipeDetailHeaderCell {
    func setupUI() {
        contentView.backgroundColor = .systemBackground
        setupConstraints()
    }
    
    func setupConstraints() {
        contentView.addSubview(recipeImageView)
        NSLayoutConstraint.activate([
            recipeImageView.topAnchor.constraint(greaterThanOrEqualTo: contentView.topAnchor),
            recipeImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            recipeImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            recipeImageView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            recipeImageView.bottomAnchor.constraint(greaterThanOrEqualTo: contentView.bottomAnchor),
        ])
        
        contentView.addSubview(blurView)
        NSLayoutConstraint.activate([
            blurView.topAnchor.constraint(equalTo: recipeImageView.topAnchor, constant: 44 + 16),
            blurView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            blurView.heightAnchor.constraint(equalToConstant: 44),
            blurView.widthAnchor.constraint(equalToConstant: 44),
        ])
        blurView.layer.cornerRadius = 44 / 2
        blurView.layer.masksToBounds = true
        
        contentView.addSubview(backButton)
        NSLayoutConstraint.activate([
            backButton.centerYAnchor.constraint(equalTo: blurView.centerYAnchor),
            backButton.centerXAnchor.constraint(equalTo: blurView.centerXAnchor)
        ])
    }
}

extension RecipeDetailHeaderCell {
    func setup(imageUrl: URL?) {
        let image = UIImage(named: "food")
        recipeImageView.image = image
    }
}
