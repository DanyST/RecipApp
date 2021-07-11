//
//  RecipeCoordinator.swift
//  RecipApp
//
//  Created by Luis Herrera Lillo on 10-07-21.
//

import UIKit

final class RecipeCoordinator: Coordinator {
    
    // MARK: - Properties
    let presenter: UINavigationController
    
    // MARK: - Initialization
    init(presenter: UINavigationController) {
        self.presenter = presenter
    }
    
    // MARK: - Methods
    override func start() {
        let recipeListViewModel = RecipeListViewModel()
        let recipeListViewController = RecipeListViewController(viewModel: recipeListViewModel)
        recipeListViewModel.coordinatorDelegate = self
        recipeListViewModel.viewDelegate = recipeListViewController
        presenter.pushViewController(recipeListViewController, animated: false)
    }
}

extension RecipeCoordinator: RecipeListViewModelCoordinatorDelegate {
    func navigateToRecipeDetail() {
        let recipeDetailViewModel = RecipeDetailViewModel()
        let recipeDetailViewController = RecipeDetailViewController(viewModel: recipeDetailViewModel)
        recipeDetailViewModel.coordinatorDelegate = self
        recipeDetailViewModel.viewDelegate = recipeDetailViewController
        presenter.pushViewController(recipeDetailViewController, animated: true)
    }
}

extension RecipeCoordinator: RecipeDetailViewModelCoordinatorDelegate {}
