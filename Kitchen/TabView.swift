//
//  TabView.swift
//  Kitchen
//
//  Created by Yaroslav Savin on 05.07.2023.
//

import SwiftUI

struct TabVew: View {
    var body: some View {
        TabView {
            MainView()
                .tabItem {
                    Label("Главная", systemImage: "house")
                }
            CategoriesView()
                .tabItem {
                    Label("Поиск", systemImage: "magnifyingglass")
            }
            BasketView()
                .tabItem {
                    Label("Корзина", systemImage: "basket")
                }
        }
        
    }
        
}

struct TabView_Previews: PreviewProvider {
    static var previews: some View {
        TabVew()
    }
}
