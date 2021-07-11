//
//  RecipeListViewModel.swift
//  RecipApp
//
//  Created by Luis Herrera Lillo on 10-07-21.
//

import Foundation

protocol RecipeListViewModelCoordinatorDelegate: AnyObject {}

protocol RecipeListViewModelViewDelegate: AnyObject {}

protocol RecipeListViewModelProtocol {}

class RecipeListViewModel: RecipeListViewModelProtocol {
    
    // MARK: - Properties
    weak var coordinatorDelegate: RecipeListViewModelCoordinatorDelegate?
    weak var viewDelegate: RecipeListViewModelViewDelegate?
}
