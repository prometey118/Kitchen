//
//  CoordinatorView.swift
//  Kitchen
//
//  Created by Yaroslav Savin on 13.07.2023.
//

import SwiftUI

struct CoordinatorView: View {
    @StateObject private var coordinator = Coordinator()
    var body: some View {
        
        NavigationStack(path: $coordinator.path) {
            coordinator.build(.mainView)
                .navigationDestination(for: Page.self) {
                    page in 
                    coordinator.build(page)
                }
            
        }
        
        .environmentObject(coordinator)
    }
    
}

struct CoordinatorView_Previews: PreviewProvider {
    static var previews: some View {
        CoordinatorView()
    }
}
