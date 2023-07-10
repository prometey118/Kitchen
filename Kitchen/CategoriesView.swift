//
//  KitchenView.swift
//  Kitchen
//
//  Created by Yaroslav Savin on 05.07.2023.
//

import SwiftUI
fileprivate var viewTemp = 0
struct CategoriesView: View {
    var size = Size()
    @State var mainTemp = 0
    let data = (1...50).map { "Item \($0)" }
    let columns = [
            GridItem(.flexible()),
            GridItem(.flexible()),
            GridItem(.flexible())
            ]
    var body: some View {
        VStack{
            Buttons(mainTemp: $mainTemp)
            switch  mainTemp {
            case 0:
                MainCategories()
            case 1:
                AsianKitchen(teg: Teg.салаты)
            case 2:
                AsianKitchen(teg: Teg.сРисом)
            case 3:
                AsianKitchen(teg: Teg.сРыбой)
            default:
                MainCategories()
            }
        }
        
        
        }
    }

struct Buttons: View {
    @Binding var mainTemp: Int
    var size = Size()
    private let dish = Kitchen.allDishes
    var body: some View {
        ScrollView(.horizontal, showsIndicators: true) {
            HStack{
                Button {
                    mainTemp = 0
                } label: {
                    Rectangle()
                        .cornerRadius(10)
                        .frame(width: size.scaleWidthForDish(94), height: size.scaleHeight(35))
                        .foregroundColor(mainTemp == 0 ? .blue : Color(red: 0.97, green: 0.97, blue: 0.96))
                        .overlay {
                            Text("Все меню")
                                .foregroundColor(mainTemp == 0 ? .white : .black)
                        }
                    
                        
                }
                

                Button {
                    mainTemp = 1
                } label: {
                    Rectangle()
                        .cornerRadius(10)
                        .frame(width: size.scaleWidthForDish(94), height: size.scaleHeight(35))
                        .foregroundColor(mainTemp == 1 ? .blue : Color(red: 0.97, green: 0.97, blue: 0.96))
                        .overlay {
                            Text("Салаты")
                                .foregroundColor(mainTemp == 1 ? .white : .black)
                        }
                    
                        
                }
                
                Button {
                    mainTemp = 2
                } label: {
                    Rectangle()
                        .cornerRadius(10)
                        .frame(width: size.scaleWidthForDish(94), height: size.scaleHeight(35))
                        .foregroundColor(mainTemp == 2 ? .blue : Color(red: 0.97, green: 0.97, blue: 0.96))
                        .overlay {
                            Text("С рыбой")
                                .foregroundColor(mainTemp == 2 ? .white : .black)
                        }
                    
                        
                }
            
                Button {
                    mainTemp = 3
                } label: {
                    Rectangle()
                        .cornerRadius(10)
                        .frame(width: size.scaleWidthForDish(94), height: size.scaleHeight(35))
                        .foregroundColor(mainTemp == 3 ? .blue : Color(red: 0.97, green: 0.97, blue: 0.96))
                        .overlay {
                            Text("С рисом")
                                .foregroundColor(mainTemp == 3 ? .white : .black)
                        }
                    
                        
                }
            }
            .padding(5)
            .padding(.top)
        }
    }

    
}

struct MainCategories: View {
    let allDish: Kitchen = Kitchen.allDishes
    @State var isPresented = false
    @State var selectedId: Int = 1
    @EnvironmentObject private var shoppingList: ShoppingList
    var size = Size()
    let columns = [
            GridItem(.flexible()),
            GridItem(.flexible()),
            GridItem(.flexible())
            ]
    var body: some View {
        ZStack {
            
            VStack {
                
                ScrollView(.vertical, showsIndicators: false) {
                    
                    
                    LazyVGrid(columns: columns, spacing: 10) {
                        ForEach(allDish.dishes, id: \.id) { dish in
                            Button(action: {
                                selectedId = dish.id
                                isPresented = true
                                
                            } ) {
                                    
                                    VStack(alignment: .center){
                                        
                                        ZStack{
                                            Rectangle()
                                                .frame(width: 100, height: 100)
                                            Color(red: 0.97, green: 0.97, blue: 0.96)
                                            AsyncImage(url: URL(string: dish.imageURL),
                                                       content: { image in
                                                image.resizable()
                                                    .offset(x: 4,y:9)
                                                    .aspectRatio(contentMode: .fill)
                                                    .scaledToFit()
                                            },
                                                       placeholder: {
                                                ProgressView()
                                            }).frame(width: 110, height: 110)
                                            
                                        }.cornerRadius(10)
                                            .padding()
                                        Text(dish.name)
                                    }
                            }
                        }
                    }
                }
            }
            .overlay(
                GeometryReader { geometry in
                    if let selectedDish = allDish.dishes.first(where: { $0.id == selectedId }) {
                        if isPresented {
                            Color.black.opacity(0.4)
                                .edgesIgnoringSafeArea(.all)
                                .onTapGesture {
                                    isPresented = false
                                }
                            VStack(alignment: .center){
                                ZStack{
                                    Rectangle()
                                        .frame(width: 100, height: 100)
                                    Color(red: 0.97, green: 0.97, blue: 0.96)
                                    AsyncImage(url: URL(string: selectedDish.imageURL),
                                               content: { image in
                                        image.resizable()
                                            .offset(x: 4,y:9)
                                            .aspectRatio(contentMode: .fill)
                                            .scaledToFit()
                                    },
                                               placeholder: {
                                        ProgressView()
                                    }).frame(width: 110, height: 110)
                                    
                                }.cornerRadius(10)
                                    .padding()
                                Text(selectedDish.name)
                                HStack(alignment: .bottom) {
                                    Text(String(selectedDish.price)+"₽")
                                        .font(Font.custom("SF Pro Display", size: 14))
                                    Text(String(selectedDish.weight)+"г.")
                                        .font(Font.custom("SF Pro Display", size: 14))
                                }
                                Text(selectedDish.description)
                                    .font(Font.custom("SF Pro Display", size: 14))
                                    .frame(width:340)
//                                button to shoplist
                                Button("Add to Shopping List") {
                                    shoppingList.addItem(ShoppingItem(name: selectedDish.name, weight: String(selectedDish.weight), price: String(selectedDish.price), image: selectedDish.imageURL))
                                            }
                            }
                            .frame(width: 350, height: 400)
                            .background(Color.white)
                            .cornerRadius(10)
                            .overlay(
                                RoundedRectangle(cornerRadius: 10)
                                    .stroke(Color.black, lineWidth: 1)
                            )
                            .padding(.top, geometry.size.height/2 - 200)
                            .padding(.horizontal, geometry.size.width/2 - 175)
                        }
                    }
                    
                }
                )
        }
    }
}

struct AsianKitchen: View {
    var size = Size()
    var teg: Teg
    let allDish = Kitchen.allDishes
    let columns = [
            GridItem(.flexible()),
            GridItem(.flexible()),
            GridItem(.flexible())
            ]
    
    var body: some View {
        let desiredTeg = teg
        let filteredDishes = allDish.dishes.filter { $0.tegs.contains(desiredTeg) }

        //

        VStack {
            
            ScrollView(.vertical, showsIndicators: false) {
                
                
                LazyVGrid(columns: columns, spacing: 10) {
                    ForEach(filteredDishes, id: \.id) { dish in
                            VStack(alignment: .center){
                            
                            ZStack{
                                Rectangle()
                                    .frame(width: 100, height: 100)
                                Color(red: 0.97, green: 0.97, blue: 0.96)
                                AsyncImage(url: URL(string: dish.imageURL),
                                           content: { image in
                                    image.resizable()
                                        .offset(x: 4,y:9)
                                        .aspectRatio(contentMode: .fill)
                                        .scaledToFit()
                                },
                                           placeholder: {
                                    ProgressView()
                                }).frame(width: 110, height: 110)
                                
                            }.cornerRadius(10)
                                .padding()
                                Text(dish.name)
                            
                            
                        }
                        
                                
                            
                        
                    }
                }
            }
        }
        
    }
}

struct KitchenView_Previews: PreviewProvider {
    static var previews: some View {
        CategoriesView()
    }
}

