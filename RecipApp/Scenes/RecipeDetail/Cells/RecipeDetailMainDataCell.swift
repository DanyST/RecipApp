//
//  RecipeDetailMainDataCell.swift
//  RecipApp
//
//  Created by Luis Herrera Lillo on 11-07-21.
//

import UIKit

final class RecipeDetailMainDataCell: UITableViewCell {
    
    // MARK: - Properties
    static let reuseIdentifer = "\(RecipeDetailMainDataCell.self)"
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.textColor = .label
        label.font = .systemFont(ofSize: 22, weight: .bold)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let detailLabel: UILabel = {
        let label = UILabel()
        label.textColor = .secondaryLabel
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let authorImageView: RoundedImageView = {
        let imageView = RoundedImageView(roundedType: .circle)
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let authorLabel: UILabel = {
        let label = UILabel()
        label.textColor = .label
        label.font = .systemFont(ofSize: 18, weight: .bold)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let likeButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(UIImage(systemName: "heart"), for: .normal)
        button.tintColor = .systemGreen
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private let likeLabel: UILabel = {
        let label = UILabel()
        label.textColor = .label
        label.font = .systemFont(ofSize: 18, weight: .bold)
        label.translatesAutoresizingMaskIntoConstraints = false
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
private extension RecipeDetailMainDataCell {
    func setupUI() {
        contentView.backgroundColor = .systemBackground
        setupConstraints()
    }
    
    func setupConstraints() {
        let authorStackView = UIStackView(arrangedSubviews: [authorImageView, authorLabel])
        authorStackView.axis = .horizontal
        authorStackView.spacing = 8
        authorStackView.alignment = .center
        authorStackView.distribution = .equalCentering
        
        NSLayoutConstraint.activate([
            authorImageView.heightAnchor.constraint(equalToConstant: 30),
            authorImageView.widthAnchor.constraint(equalToConstant: 30)
        ])
        
        let likeStackView = UIStackView(arrangedSubviews: [likeButton, likeLabel])
        authorStackView.axis = .horizontal
        authorStackView.spacing = 8
        authorStackView.alignment = .trailing
        authorStackView.distribution = .fill
        
        NSLayoutConstraint.activate([
            likeButton.heightAnchor.constraint(equalToConstant: 30),
            likeButton.widthAnchor.constraint(equalToConstant: 30)
        ])
        
        let footerStackView = UIStackView(arrangedSubviews: [authorStackView, likeStackView])
        footerStackView.axis = .horizontal
        footerStackView.distribution = .fill
        footerStackView.alignment = .center
        
        let containerStackView = UIStackView(arrangedSubviews: [titleLabel, detailLabel, footerStackView])
        containerStackView.axis = .vertical
        containerStackView.spacing = 16
        containerStackView.distribution = .fillEqually
        containerStackView.translatesAutoresizingMaskIntoConstraints = false
        
        contentView.addSubview(containerStackView)
        NSLayoutConstraint.activate([
            containerStackView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 16),
            containerStackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            containerStackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            containerStackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -16),
        ])
    }
}

// MARK: - SyncUI
extension RecipeDetailMainDataCell {
    func setup(title: String, category: String, time: String, authorImageUrl: URL? = nil, authorName: String, likeCount: Int) {
        titleLabel.text = title
        detailLabel.text = "\(category) \(time)"
        authorImageView.image = UIImage(named: "food")
        authorLabel.text = authorName
        likeLabel.text = "\(likeCount) Likes"
    }
}
