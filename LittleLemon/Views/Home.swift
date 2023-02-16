//
//  Home.swift
//  LittleLemon
//
//  Created by George Chang on 2023-02-08.
//

import SwiftUI

struct Home: View {
    let persistence = PersistenceController.shared
    
    var body: some View {
        VStack {
            TabView {
                Menu(category: Category.mains)
                .tabItem {
                    Label("Menu", systemImage: "list.dash")
                }
                
                UserProfile()
                .tabItem {
                    Label("Profile", systemImage: "square.and.pencil")
                }
            }
            .navigationBarBackButtonHidden(true)
        }
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}
