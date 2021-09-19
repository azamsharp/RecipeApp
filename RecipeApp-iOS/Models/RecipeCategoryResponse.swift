//
//  RecipeCategoryResponse.swift
//  RecipeApp-iOS
//
//  Created by Mohammad Azam on 9/19/21.
//

import Foundation

struct RecipeCategoryResponse: Decodable {
    let categories: [RecipeCategory]
}

struct RecipeCategory: Decodable {
    let imageUrl: String
    let title: String 
}
