//
//  HeroView.swift
//  LittleLemon
//
//  Created by George Chang on 2023-02-09.
//

import SwiftUI

struct HeroView: View {
    var body: some View {
        VStack(alignment: .leading) {
            Text("Little Lemon")
                .font(.title)
                .fontWeight(.bold)
                .foregroundColor(.yellow)
            HStack {
                VStack(alignment: .leading) {
                    Text("Richmond")
                        .font(.title2)
                        .padding(.bottom)
                    Text("We are a family owned Mediterranean restaurant, focused on traditional recipes served with a modern twist.")
                        .font(.subheadline)
                }
                .foregroundColor(Color.white)
                
                Image("hero")
                    .resizable()
                    .cornerRadius(20)
                    .frame(width: 160, height: 160)
            }
        }
        .padding(EdgeInsets(top: 35, leading: 20, bottom: 35, trailing: 20))
        .background(Color(red: 0.29, green: 0.37, blue: 0.34, opacity: 1.00))
        .frame(maxWidth: .infinity)
    }
}

struct HeroView_Previews: PreviewProvider {
    static var previews: some View {
        HeroView()
    }
}
