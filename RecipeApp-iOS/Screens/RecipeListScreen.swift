//
//  RecipeListScreen.swift
//  RecipeApp-iOS
//
//  Created by Mohammad Azam on 9/19/21.
//

import SwiftUI

struct RecipeListScreen: View {
    
    let recipeCategory: RecipeCategoryViewModel
    @StateObject private var recipeListVM = RecipeListViewModel()
    
    var body: some View {
        RecipeListView(recipes: recipeListVM.recipes)
            .task {
                await recipeListVM.populateRecipesByCategory(name: recipeCategory.title)
            }
    }
}

struct RecipeListScreen_Previews: PreviewProvider {
    static var previews: some View {
       
        let recipeCategoryVM = RecipeCategoryViewModel(RecipeCategory(imageUrl: "https://res.cloudinary.com/dk4ocuiwa/image/upload/v1618257399/RecipesApi/Chicken.png", title: "Chicken"))
        
        RecipeListScreen(recipeCategory: recipeCategoryVM)
    }
}
