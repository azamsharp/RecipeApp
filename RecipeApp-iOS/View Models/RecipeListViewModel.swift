//
//  RecipeListViewModel.swift
//  RecipeApp-iOS
//
//  Created by Mohammad Azam on 9/19/21.
//

import Foundation

@MainActor
class RecipeListViewModel: ObservableObject {
    
    @Published var recipes: [RecipeViewModel] = [RecipeViewModel]()
    
    func populateRecipesByCategory(name: String) async {
        
        do {
            
            let recipeResponse = try await Webservice().get(url: Constants.Urls.recipeByCategoryName(name)) { data in
                return try? JSONDecoder().decode(RecipeResponse.self, from: data)
            }
            self.recipes = recipeResponse.recipes.map(RecipeViewModel.init)
            
        } catch {
            print(error)
        }
    }
    
}

struct RecipeViewModel {
    
    private let recipe: Recipe
    
    init(_ recipe: Recipe) {
        self.recipe = recipe
    }
    
    var id: String {
        recipe.id
    }
    
    var title: String {
        recipe.title
    }
    
    var imageURL: URL? {
        URL(string: recipe.imageUrl)
    }
    
}
