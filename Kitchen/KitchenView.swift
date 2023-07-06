//
//  KitchenView.swift
//  Kitchen
//
//  Created by Yaroslav Savin on 05.07.2023.
//

import SwiftUI

struct KitchenView: View {
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
                .padding(20)
            }
            LazyVGrid(columns: columns, spacing: 10) {
                ForEach(data, id: \.self) { item in
                    VStack{
                        AsyncImage(url: URL(string: url5),
                                               content: { image in
                                                       image.resizable()
                                .aspectRatio(contentMode: .fill)
//                                .resizable()
                                                    .scaledToFit()
                                .background(Color(red: 0.97, green: 0.97, blue: 0.96))
                                                           
                                                           .cornerRadius(20)
                                                   },
                                                   placeholder: {
                                                       ProgressView()
                        }).frame(width: 150, height: 100)
                        Text(item)
                        
                    }
                    
                }
            }
        }
    }
}

struct KitchenView_Previews: PreviewProvider {
    static var previews: some View {
        KitchenView()
    }
}
func pr() {
    print("sss")
}
