//
//  ContentView.swift
//  Kitchen
//
//  Created by Yaroslav Savin on 04.07.2023.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack(spacing: 20) {
            TextOnImage(text: "Пекарни и кондитерские", url: url)
            TextOnImage(text: "Фастфуд", url: url2)
            TextOnImage(text: "Азиатская кухня", url: url3)
            TextOnImage(text: "Супы", url: url4)
        }
    }
    
}




struct TextOnImage: View {
    var size = Size()
    var text: String
    var url: String
    var body: some View {
        ZStack {
//            Color.red.ignoresSafeArea()
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
                .frame(width: size.scaleWidth(130), height: size.scaleHeight(100))
                .border(Color(.red))
                .offset(x: -100, y: -40)
            
        }
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
