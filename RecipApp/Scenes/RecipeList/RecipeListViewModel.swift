//
//  RecipeListViewModel.swift
//  RecipApp
//
//  Created by Luis Herrera Lillo on 10-07-21.
//

import Foundation

protocol RecipeListViewModelCoordinatorDelegate: AnyObject {}

protocol RecipeListViewModelViewDelegate: AnyObject {}

protocol RecipeListViewModelProtocol {
    var numberOfSections: Int { get }
    func numberOfRows(in section: Int) -> Int
}

class RecipeListViewModel: RecipeListViewModelProtocol {
    
    // MARK: - Properties
    weak var coordinatorDelegate: RecipeListViewModelCoordinatorDelegate?
    weak var viewDelegate: RecipeListViewModelViewDelegate?
    
    var numberOfSections: Int {
        return 1
    }
    
    func numberOfRows(in section: Int) -> Int {
        return 10
    }
}
