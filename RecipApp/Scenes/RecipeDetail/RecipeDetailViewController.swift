//
//  RecipeDetailViewController.swift
//  RecipApp
//
//  Created by Luis Herrera Lillo on 10-07-21.
//

import UIKit

class RecipeDetailViewController: UIViewController, RecipeDetailViewModelViewDelegate {
    
    enum Constants {
        static let headerRow = 0
        static let mainDataRow = 1
        static let descriptionRow = 2
        static let ingredientRow = 3
    }
    
    // MARK: - Properties
    private let viewModel: RecipeDetailViewModelProtocol
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .plain)
        tableView.backgroundColor = .systemBackground
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 150
        tableView.tableFooterView = UIView()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(RecipeDetailHeaderCell.self, forCellReuseIdentifier: RecipeDetailHeaderCell.reuseIdentifier)
        tableView.register(RecipeDetailMainDataCell.self, forCellReuseIdentifier: RecipeDetailMainDataCell.reuseIdentifier)
        tableView.register(RecipeDescriptionCell.self, forCellReuseIdentifier: RecipeDescriptionCell.reuseIdentifier)
        tableView.register(RecipeIngredientCell.self, forCellReuseIdentifier: RecipeIngredientCell.reuseIdentifier)
        tableView.contentInsetAdjustmentBehavior = .never
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    
    // MARK: - Life Cycle
    override func loadView() {
        view = UIView()
        view.backgroundColor = .systemBackground
        
        view.addSubview(tableView)
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.isHidden = true
    }
    
    // MARK: - Initialization
    init(viewModel: RecipeDetailViewModelProtocol) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - UITableViewDataSource
extension RecipeDetailViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return viewModel.numberOfSections
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfRows(in: section)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.row {
        case Constants.headerRow:
            let cell = tableView.dequeueReusableCell(withIdentifier: RecipeDetailHeaderCell.reuseIdentifier, for: indexPath) as! RecipeDetailHeaderCell
                cell.setup(imageUrl: nil)            
            return cell
            
        case Constants.mainDataRow:
            let cell = tableView.dequeueReusableCell(withIdentifier: RecipeDetailMainDataCell.reuseIdentifier, for: indexPath) as! RecipeDetailMainDataCell
            cell.setup(title: "Pizza", category: "Pizza", time: "60 mins", authorName: "Jon Wick", likeCount: 100)
            return cell
            
        case Constants.descriptionRow:
            let cell = tableView.dequeueReusableCell(withIdentifier: RecipeDescriptionCell.reuseIdentifier, for: indexPath) as! RecipeDescriptionCell
            cell.setup(description: "Your recipe has been uploaded, you can see it on your profile. Your recipe has been uploaded, you can see it on your. Your recipe has been uploaded, you can see it on your profile. Your recipe has been uploaded, you can see it on your. Your recipe has been uploaded, you can see it on your profile. Your recipe has been uploaded, you can see it on your. Your recipe has been uploaded, you can see it on your profile. Your recipe has been uploaded, you can see it on your")
            
            return cell
        
        case Constants.ingredientRow:
            let cell = tableView.dequeueReusableCell(withIdentifier: RecipeIngredientCell.reuseIdentifier, for: indexPath) as! RecipeIngredientCell
            cell.setup(withIngredients: ["4 Eggs", "1/2 Butter", "100gr Sugar", "1/2kg Chocolate", "4 Eggs", "1/2 Butter", "100gr Sugar", "1/2kg Chocolate"])
            return cell
            
        default:
            
            let defaultCell = UITableViewCell(style: .default, reuseIdentifier: "DefaultCell")
            return defaultCell
        }
    }
}

// MARK: - UITableViewDelegate
extension RecipeDetailViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        guard Constants.headerRow == indexPath.row else {
            return UITableView.automaticDimension
        }
        return view.frame.height / 3
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
