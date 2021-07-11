//
//  AppCoordinator.swift
//  RecipApp
//
//  Created by Luis Herrera Lillo on 10-07-21.
//

import UIKit

final class AppCoordinator: Coordinator {
    
    // MARK: - Properties
    let window: UIWindow
    
    // MARK: - Initialization
    init(window: UIWindow) {
        self.window = window
    }
    
    // MARK: - Methods
    override func start() {
        let recipeListViewController = RecipeListViewController()
        let recipeListNavigation = UINavigationController(rootViewController: recipeListViewController)
        
        window.rootViewController = recipeListNavigation
        window.makeKeyAndVisible()
    }
}
