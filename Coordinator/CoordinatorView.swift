//
//  CoordinatorView.swift
//  Kitchen
//
//  Created by Yaroslav Savin on 13.07.2023.
//

import SwiftUI

struct CoordinatorView: View {
    @StateObject private var coordinator = Coordinator()
    @StateObject private var shoppingList = ShoppingList()
    var body: some View {
        NavigationStack(path: $coordinator.path) {
            coordinator.build(.tabVew)
                .navigationDestination(for: Page.self) {
                    page in 
                    coordinator.build(page)
                }
        }
        .environmentObject(coordinator)
        .environmentObject(shoppingList)
    }
}

struct CoordinatorView_Previews: PreviewProvider {
    static var previews: some View {
        CoordinatorView()
    }
}
