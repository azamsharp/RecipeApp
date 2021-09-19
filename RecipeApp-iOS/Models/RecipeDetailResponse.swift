//
//  RecipeDetailResponse.swift
//  RecipeApp-iOS
//
//  Created by Mohammad Azam on 9/19/21.
//

import Foundation

struct RecipeDetailResponse: Decodable {
    let recipe: RecipeDetail
}

struct RecipeDetail: Decodable {
    let imageUrl: String
    let id: String
    let title: String
    let ingredients: [String]
}
