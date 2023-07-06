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
                MainView()
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
                    mainTemp = 0
                }
                .buttonStyle(.borderedProminent)
                Button("Item 2") {
                    mainTemp = 1
                }
                .buttonStyle(.borderedProminent)
                Button("Все меню") {
                    viewTemp = 2
                }
                .buttonStyle(.borderedProminent)
                Button("Все меню") {
                    viewTemp = 3
                }
                .buttonStyle(.borderedProminent)
            }
            .padding(5)
            .padding(.top)
        }
    }

    
}

struct MainCategories: View {
    var size = Size()
    let data = (1...50).map { "Item \($0)" }
    let columns = [
            GridItem(.flexible()),
            GridItem(.flexible()),
            GridItem(.flexible())
            ]
    var body: some View {
        VStack {
            
            ScrollView(.vertical, showsIndicators: false) {
                
                
                LazyVGrid(columns: columns, spacing: 10) {
                    ForEach(data, id: \.self) { item in
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

