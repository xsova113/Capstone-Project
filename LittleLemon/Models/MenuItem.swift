//
//  MenuItem.swift
//  LittleLemon
//
//  Created by George Chang on 2023-02-09.
//

import Foundation

enum Category: String, CaseIterable {
    case mains = "Mains"
    case starters = "Starters"
    case desserts = "Desserts"
    case drinks = "Drinks"
}

struct MenuItem: Codable, Identifiable {
    let id: Int
    let title: String
    let image: String
    let price: String
    let description: String
    let category: Category.RawValue
}

