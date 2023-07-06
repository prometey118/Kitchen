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
                    Label("Order", systemImage: "list.dash")
                }
            CategoriesView()
                .tabItem {
                    Label("Order", systemImage: "square.and.pencil")
            }
        }
    }
}

struct TabView_Previews: PreviewProvider {
    static var previews: some View {
        TabVew()
    }
}
