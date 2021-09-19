//
//  RecipeCategoryListScreen.swift
//  RecipeApp-iOS
//
//  Created by Mohammad Azam on 9/19/21.
//

import SwiftUI

struct RecipeCategoryListScreen: View {
    
    @StateObject var model: RecipeCategoryListViewModel = RecipeCategoryListViewModel()
    
    var body: some View {
        NavigationView {
            RecipeCategoryListView(categories: model.recipeCategories)
                .task {
                    await model.populateCategories()
                }
            .navigationTitle("Recipes")
        }
    }
}

struct RecipeCategoryListScreen_Previews: PreviewProvider {
    static var previews: some View {
        RecipeCategoryListScreen()
    }
}
