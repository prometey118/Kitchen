//
//  ContentView.swift
//  Kitchen
//
//  Created by Yaroslav Savin on 04.07.2023.
//

import SwiftUI

struct MainView: View {
    private var categores: Categores = Categores.allCategores
    var body: some View {
        NavigationView {
            VStack(spacing: 20) {
                    ForEach(categores.сategories, id: \.id) { category in
                        NavigationLink {
                            CategoriesView()
                        } label: {
                            TextOnImage(text: category.name, url: category.imageURL)
                        }
                    }
            }
        }
    }
    
}




struct TextOnImage: View {
    var size = Size()
    var kitchens = [сategories]()
    var text: String
    var url: String
    var body: some View {
        ZStack {
            AsyncImage(url: URL(string: url),
                                   content: { image in
                                           image.resizable()
                                               .aspectRatio(contentMode: .fit)
                                       },
                                       placeholder: {
                                           ProgressView()
            }).frame(width: size.scaleWidth(434), height: size.scaleHeight(148))
            Text(text)
                .font(.system(size: 20, weight: .medium))
                .frame(width: size.scaleWidth(154), height: size.scaleHeight(100), alignment: .topLeading)
                .border(Color(.red))
                .offset(x: size.scaleToLeftCorner(), y: -25)
                .padding(.top)
                .padding(.leading)
        }
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
