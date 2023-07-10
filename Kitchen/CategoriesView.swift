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
                AsianKitchen()
            case 3:
                MainCategories()
            default:
                MainCategories()
            }
        }
        
        
        }
    }

struct Buttons: View {
    @Binding var mainTemp: Int
    var body: some View {
        ScrollView(.horizontal, showsIndicators: true) {
            HStack{
                Button("Все меню") {
                    withAnimation {
                        mainTemp = 0
                    }
//                    mainTemp = 0
                }
                .buttonStyle(.borderedProminent)
                Button("Item 2") {
                    withAnimation {
                        mainTemp = 1
                    }
                }
                .buttonStyle(.borderedProminent)
                Button("Все меню") {
                    mainTemp = 2
                }
                .buttonStyle(.borderedProminent)
                Button("Все меню") {
                    mainTemp = 3
                }
                .buttonStyle(.borderedProminent)
            }
            .padding(5)
            .padding(.top)
        }
    }

    
}

struct MainCategories: View {
    private let allDish: Kitchen = Kitchen.allDishes
    @State var isPresented = false
    var size = Size()
//    let data = (1...50).map { "Item \($0)" }
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
                            Button(action: {isPresented = true} ) {
                                    
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
                                                //                                .resizable()
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
                                AsyncImage(url: URL(string: url5),
                                           content: { image in
                                    image.resizable()
                                        .offset(x: 4,y:9)
                                        .aspectRatio(contentMode: .fill)
                                    //                                .resizable()
                                        .scaledToFit()
                                },
                                           placeholder: {
                                    ProgressView()
                                }).frame(width: 110, height: 110)
                                
                            }.cornerRadius(10)
                                .padding()
                            Text("item")
                            
                            
                            
                        }
                        .frame(width: 300, height: 300)
                        .background(Color.white)
                        .cornerRadius(10)
                        .overlay(
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(Color.black, lineWidth: 1)
                        )
                        .padding(.top, geometry.size.height/2 - 150)
                        .padding(.horizontal, geometry.size.width/2 - 150)
                    }
                }
                )
        }
    }
}

struct AsianKitchen: View {
    var size = Size()
    var data = (1...50).map { "Item \($0)" }
    @State private var searchTerm = "Item 2"
    var filteredItems: [String] {
            return data.filter { $0.contains(searchTerm) }
        }
    let columns = [
            GridItem(.flexible()),
            GridItem(.flexible()),
            GridItem(.flexible())
            ]
    var body: some View {
        VStack {
            
            ScrollView(.vertical, showsIndicators: false) {
                
                
                LazyVGrid(columns: columns, spacing: 10) {
                    ForEach(filteredItems, id: \.self) { item in
                            VStack(alignment: .center){
                                
                                ZStack{
                                    Rectangle()
                                        .frame(width: 100, height: 100)
                                    Color(red: 0.97, green: 0.97, blue: 0.96)
                                    AsyncImage(url: URL(string: url5),
                                               content: { image in
                                        image.resizable()
                                            .offset(x: 4,y:9)
                                            .aspectRatio(contentMode: .fill)
                                        //                                .resizable()
                                            .scaledToFit()
                                    },
                                               placeholder: {
                                        ProgressView()
                                    }).frame(width: 110, height: 110)
                                    
                                }.cornerRadius(10)
                                    .padding()
                                Text(item)
                                
                                
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

