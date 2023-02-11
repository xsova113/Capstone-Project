//
//  MenuItem.swift
//  LittleLemon
//
//  Created by George Chang on 2023-02-09.
//

import Foundation

struct MenuItem: Decodable, Identifiable {
    let id: Int
    let title: String
    let image: String
    let price: String
    let description: String
}

