//
//  BasketView.swift
//  Kitchen
//
//  Created by Yaroslav Savin on 10.07.2023.
//

import SwiftUI

struct BasketView: View {
    @EnvironmentObject private var shoppingList: ShoppingList
    var body: some View {
        NavigationView {
                    List(shoppingList.items) { item in
                        HStack {
                            Text(item.name)
                            Text("\(shoppingList.dict[item.name]!)")
                        }
                    }
                    .navigationBarTitle("Shopping List")
                }
    }
}

struct BasketView_Previews: PreviewProvider {
    static var previews: some View {
        BasketView()
    }
}
