//
//  RecipeCategoryListViewModel.swift
//  RecipeApp-iOS
//
//  Created by Mohammad Azam on 9/19/21.
//

import Foundation

@MainActor 
class RecipeCategoryListViewModel: ObservableObject {
    
    @Published var recipeCategories: [RecipeCategoryViewModel] = []
    
    func populateCategories() async {
        
        do {
            let recipeCategoryResponse = try await Webservice().get(url: Constants.Urls.recipeCategoriesURL) { data in
                return try? JSONDecoder().decode(RecipeCategoryResponse.self, from: data)
            }
            
            self.recipeCategories = recipeCategoryResponse.categories.map(RecipeCategoryViewModel.init)
            
        } catch {
            print(error)
        }
        
    }
    
}

struct RecipeCategoryViewModel: Identifiable {
    
    let id = UUID()
    private let recipeCategory: RecipeCategory
    
    init(_ recipeCategory: RecipeCategory) {
        self.recipeCategory = recipeCategory
    }
    
    var title: String {
        recipeCategory.title
    }
    
    var imageUrl: URL? {
        URL(string: recipeCategory.imageUrl)
    }
    
}
