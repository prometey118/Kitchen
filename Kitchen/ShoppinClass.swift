//
//  ShoppinClass.swift
//  Kitchen
//
//  Created by Yaroslav Savin on 10.07.2023.
//

import Foundation
class ShoppingList: ObservableObject {
    @Published private(set) var items: [ShoppingItem] = []
    @Published private(set) var dict: [String: Int] = [:]
    func addItem(_ item: ShoppingItem) {
        items.append(item)
        if dict[item.name] == nil {
            dict[item.name] = 1
        } else { dict[item.name]! += 1 }
    }
}
struct ShoppingItem: Identifiable {
    let id = UUID()
    let name: String
    let weight: String
    let price: String
    let image: String
}
