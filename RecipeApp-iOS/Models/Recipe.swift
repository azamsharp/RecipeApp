//
//  Recipe.swift
//  RecipeApp-iOS
//
//  Created by Mohammad Azam on 9/19/21.
//

import Foundation

struct RecipeResponse: Decodable {
    let recipes: [Recipe]
}

struct Recipe: Decodable {
    let id: String
    let imageUrl: String
    let title: String
}
