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
        let recipeListNavigation = UINavigationController()
        let recipeCoordinator = RecipeCoordinator(presenter: recipeListNavigation)
        addChildCoordinator(recipeCoordinator)
        recipeCoordinator.start()
        
        window.rootViewController = recipeListNavigation
        window.makeKeyAndVisible()
    }
}
