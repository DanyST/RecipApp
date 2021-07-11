//
//  RecipeListViewModel.swift
//  RecipApp
//
//  Created by Luis Herrera Lillo on 10-07-21.
//

import Foundation

protocol RecipeListViewModelCoordinatorDelegate: AnyObject {
    func navigateToRecipeDetail()
}

protocol RecipeListViewModelViewDelegate: AnyObject {}

protocol RecipeListViewModelProtocol {
    var numberOfSections: Int { get }
    func numberOfRows(in section: Int) -> Int
    func didSelectItem(at indexPath: IndexPath)
}

class RecipeListViewModel: RecipeListViewModelProtocol {
   
    // MARK: - Properties
    weak var coordinatorDelegate: RecipeListViewModelCoordinatorDelegate?
    weak var viewDelegate: RecipeListViewModelViewDelegate?
    
    // MARK: - RecipeListViewModelProtocol
    var numberOfSections: Int {
        return 1
    }
    
    func numberOfRows(in section: Int) -> Int {
        return 10
    }
    
    func didSelectItem(at indexPath: IndexPath) {
        coordinatorDelegate?.navigateToRecipeDetail()
    }
}
