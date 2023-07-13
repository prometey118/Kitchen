//
//  Coordinator.swift
//  Kitchen
//
//  Created by Yaroslav Savin on 13.07.2023.
//

import SwiftUI
enum Page: String, Identifiable {
    case categories, basket, mainView, tabVew
    var id: String {
        self.rawValue
    }
}

class Coordinator: ObservableObject {
    @Published var path = NavigationPath()
    func push (_ page:Page) {
        path.append(page)
    }
    func pop() {
        path.removeLast()
    }
    func popToRoot() {
        path.removeLast(path.count)
    }
    @ViewBuilder
    func build(_ page:Page) -> some View {
        switch page {
        case .mainView:
            MainView()
        case .categories:
            CategoriesView()
        case .basket:
            BasketView()
        case .tabVew:
            TabVew()
        }
    }
}
