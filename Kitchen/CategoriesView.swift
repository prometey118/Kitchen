//
//  KitchenView.swift
//  Kitchen
//
//  Created by Yaroslav Savin on 05.07.2023.
//

import SwiftUI

struct CategoriesView: View {
    var size = Size()
    let data = (1...10).map { "Item \($0)" }
    let columns = [
            GridItem(.flexible()),
            GridItem(.flexible()),
            GridItem(.flexible())
            ]
    var body: some View {
        VStack {
            ScrollView(.horizontal, showsIndicators: false) {
                HStack{
                    Button("Все меню", action: pr)
                        .buttonStyle(.borderedProminent)
                    Button("Все меню", action: pr)
                        .buttonStyle(.borderedProminent)
                    Button("Все меню", action: pr)
                        .buttonStyle(.borderedProminent)
                    Button("Все меню", action: pr)
                        .buttonStyle(.borderedProminent)
                }
                .padding(5)
            }
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
                            }).frame(width: 100, height: 100)
                            
                        }.cornerRadius(20)
                        .padding()
                        Text(item)
                        
                        
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
func pr() {
    print("sss")
}
