//
//  RecipeListViewController.swift
//  RecipApp
//
//  Created by Luis Herrera Lillo on 10-07-21.
//

import UIKit

final class RecipeListViewController: UIViewController {
    
    enum Constants {
        static let columns: CGFloat = 2
        static let cellId = "RecipeCell"
    }
    
    // MARK: - Properties
    private let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.contentInset = .init(top: 0, left: 16, bottom: 0, right: 16)
        collectionView.backgroundColor = .systemBackground
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: Constants.cellId)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        return collectionView
    }()
    
    // MARK: - Life Cycle
    override func loadView() {
        view = UIView()
        view.backgroundColor = .systemBackground
        
        view.addSubview(collectionView)
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    // MARK: - Methods
    func setupUI() {
        navigationController?.navigationBar.prefersLargeTitles = true
        title = "RecipApp"
    }
}
