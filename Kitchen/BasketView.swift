//
//  BasketView.swift
//  Kitchen
//
//  Created by Yaroslav Savin on 10.07.2023.
//

import SwiftUI

struct BasketView: View {
    @EnvironmentObject private var shoppingList: ShoppingList
    @State var temp = 1
    var body: some View {
        NavigationView {
                    List(shoppingList.items) { item in
                        HStack {
                            
                            AsyncImage(url: URL(string: item.image),
                                       content: { image in
                                image.resizable()
                                    .offset(x: 5,y:9)
                                    .aspectRatio(contentMode: .fill)
                                    .scaledToFit()
                            },
                                       placeholder: {
                                ProgressView()
                            }).frame(width: 40, height: 40)
                            Text(item.name)
                            HStack {
                                        Button(action: {
                                            if let item2 = shoppingList.dict[item.name] {
                                                temp = item2
                                            }
                                            if temp > 0 {
                                                temp -= 1
                                            }
                                        }) {
                                            Image(systemName: "minus")
                                        }
                                        .padding(.trailing, 8)

                                Text("\(shoppingList.dict[item.name]!)")
                                            .font(.headline)
                                            .frame(width: 40)

                                        Button(action: {
                                            temp = shoppingList.dict[item.name]!
                                            temp += 1
                                        }) {
                                            Image(systemName: "plus")
                                        }
                                        .padding(.leading, 8)
                                    }
                                    .foregroundColor(.white)
                                    .background(Color.blue)
                                    .cornerRadius(10)
                                    .padding(4)
                            
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
