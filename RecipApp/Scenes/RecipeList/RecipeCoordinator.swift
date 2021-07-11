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
        let recipeListViewController = RecipeListViewController()
        presenter.pushViewController(recipeListViewController, animated: false)
    }
}
