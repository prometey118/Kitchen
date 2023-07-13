//
//  Kitchens.swift
//  Kitchen
//
//  Created by Yaroslav Savin on 04.07.2023.
//

import Foundation
let urlCategores = "https://run.mocky.io/v3/058729bd-1402-4578-88de-265481fd7d54"
struct Categores: Codable {
    let сategories: [Сategory]
    static let allCategores: Categores = decode(url: urlCategores, struct: Categores.self)
    
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
