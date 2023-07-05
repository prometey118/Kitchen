//
//  TabView.swift
//  Kitchen
//
//  Created by Yaroslav Savin on 05.07.2023.
//

import SwiftUI

struct TabVew: View {
    var body: some View {
        TabView {
            ContentView()
                .tabItem {
                    Label("Order", systemImage: "list.dash")
                }
            ContentView()
                .tabItem {
                    Label("Order", systemImage: "square.and.pencil")
            }
        }
    }
}

struct TabView_Previews: PreviewProvider {
    static var previews: some View {
        TabVew()
    }
}
