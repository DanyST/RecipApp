//
//  RecipeViewModel.swift
//  RecipApp
//
//  Created by Luis Herrera Lillo on 10-07-21.
//

import Foundation


protocol RecipeDetailViewModelCoordinatorDelegate: AnyObject {}

protocol RecipeDetailViewModelViewDelegate: AnyObject {}

protocol RecipeDetailViewModelProtocol {
    var numberOfSections: Int { get }
    func numberOfRows(in section: Int) -> Int
}

class RecipeDetailViewModel: RecipeDetailViewModelProtocol {
    
    // MARK: - Properties
    weak var coordinatorDelegate: RecipeDetailViewModelCoordinatorDelegate?
    weak var viewDelegate: RecipeDetailViewModelViewDelegate?
    
    var numberOfSections: Int {
        return 1
    }
    
    func numberOfRows(in section: Int) -> Int {
        return 4
    }
}
