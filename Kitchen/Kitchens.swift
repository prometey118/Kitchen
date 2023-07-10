//
//  Kitchens.swift
//  Kitchen
//
//  Created by Yaroslav Savin on 04.07.2023.
//

import Foundation
struct Categores: Codable {
    let сategories: [Сategory]
    static let allCategores: Categores = decode(url: urlD, struct: Categores.self)
    
}

struct Сategory: Codable {
    let id: Int
    let name: String
    let imageURL: String
    enum CodingKeys: String, CodingKey {
            case id, name
            case imageURL = "image_url"
        }
}
