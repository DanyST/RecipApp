//
//  RecipeCollectionViewCell.swift
//  RecipApp
//
//  Created by Luis Herrera Lillo on 10-07-21.
//

import UIKit

final class RecipeCollectionViewCell: UICollectionViewCell, ReusableView {
    
    // MARK: - Properties
    private let imageView: RoundedImageView = {
        let imageView = RoundedImageView(roundedType: .rounded)
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.textColor = .label
        label.font = .systemFont(ofSize: 22, weight: .bold)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let categoryLabel: UILabel = {
        let label = UILabel()
        label.textColor = .secondaryLabel
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let timeLabel: UILabel = {
        let label = UILabel()
        label.textColor = .secondaryLabel
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    // MARK: - Initialization
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

// MARK: - UI Methods
private extension RecipeCollectionViewCell {
    func setupUI() {
        backgroundColor = .systemBackground
        setupConstraints()
    }
    
    func setupConstraints() {
        contentView.addSubview(imageView)
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: contentView.topAnchor),
            imageView.heightAnchor.constraint(equalTo: contentView.widthAnchor),
            imageView.widthAnchor.constraint(equalTo: contentView.widthAnchor)
        ])
        
        contentView.addSubview(titleLabel)
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 16),
            titleLabel.leadingAnchor.constraint(equalTo: imageView.leadingAnchor),
            titleLabel.trailingAnchor.constraint(equalTo: imageView.trailingAnchor)
        ])
        
        setupDetailLabels()
    }
    
    func setupDetailLabels() {
        let stackView = UIStackView(arrangedSubviews: [categoryLabel, timeLabel])
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .horizontal
        stackView.distribution = .fill
        stackView.alignment = .fill
        
        contentView.addSubview(stackView)
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 8),
            stackView.leadingAnchor.constraint(equalTo: imageView.leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: imageView.trailingAnchor),
        ])
    }

}

// MARK: - Sync data UI
extension RecipeCollectionViewCell {
    func setup(with imageUrl: URL? = nil, title: String, category: String, time: String) {
        if let imageUrl = imageUrl {
            loadImage(fromUrl: imageUrl)
        } else {
            self.imageView.image = UIImage(named: "food")
        }
        
        titleLabel.text = title
        categoryLabel.text = category
        timeLabel.text = time
    }
    
    private func loadImage(fromUrl url: URL) {
        DispatchQueue.global(qos: .userInitiated).async { [weak self] in
            guard let data = try? Data(contentsOf: url),
                  let image = UIImage(data: data) else { return }
         
            DispatchQueue.main.async {
                self?.imageView.image = image
            }
        }
    }
}
