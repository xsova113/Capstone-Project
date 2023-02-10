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
                .font(Font.custom("MarkaziText-Medium", size: 64))
                .foregroundColor(.yellow)
                .padding(.bottom, -10)
            HStack {
                VStack(alignment: .leading) {
                    Text("Richmond")
                        .font(Font.custom("MarkaziText-Regular", size: 40))
                        .padding(.top, -25)
                        .padding(.bottom, 5)
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
        .padding(.leading)
        .padding(.trailing)
        .background(Color(red: 0.29, green: 0.37, blue: 0.34, opacity: 1.00))
        .frame(maxWidth: .infinity)
    }
}

struct HeroView_Previews: PreviewProvider {
    static var previews: some View {
        HeroView()
    }
}
