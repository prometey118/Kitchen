//
//  TabView.swift
//  Kitchen
//
//  Created by Yaroslav Savin on 05.07.2023.
//

import SwiftUI

struct TabVew: View {
    @StateObject private var shoppingList = ShoppingList()
    var body: some View {
        TabView {
            MainView()
                .tabItem {
                    Label("Order", systemImage: "house")
                }
            CategoriesView()
                .tabItem {
                    Label("Order", systemImage: "magnifyingglass")
            }
            BasketView()
                .tabItem {
                    Label("Order", systemImage: "basket")
                }
        }
        
        .environmentObject(shoppingList)
    }
        
}

struct TabView_Previews: PreviewProvider {
    static var previews: some View {
        TabVew()
    }
}
