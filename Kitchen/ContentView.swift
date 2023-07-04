//
//  ContentView.swift
//  Kitchen
//
//  Created by Yaroslav Savin on 04.07.2023.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Hui()
            Hui()
        }
    }
    
}



struct Hui: View {
    var size = Size()
    var body: some View {
        ZStack {
            VStack {
//                Image(systemName: "globe")
//                    .
//                    .foregroundColor(.accentColor)
                Text("awc").frame(maxWidth: 343, maxHeight: 148)
                    .background(AsyncImage(url: URL(string: url),
                                           content: { image in
                                                   image.resizable()
                                                       .aspectRatio(contentMode: .fit)
                                               },
                                               placeholder: {
                                                   ProgressView()
                                               }))
                
                
                
                
                
            }
        }
        .cornerRadius(20)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
