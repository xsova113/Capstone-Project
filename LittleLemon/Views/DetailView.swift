//
//  DetailView.swift
//  LittleLemon
//
//  Created by George Chang on 2023-02-09.
//

import SwiftUI
import CoreData

struct DetailView: View {
    
    let dish: Dish
    @State private var num = 0
    
    var body: some View {
        
        
        VStack {
            LogoView()
            
            let url = URL(string: dish.image ?? "")
            AsyncImage(url: url) { image in image
                    .image?
                    .resizable()
                    .aspectRatio(contentMode: .fill)
            }
            .frame(width: 395, height: 250,alignment: .center)
            .padding()
            
            Text(dish.title ?? "")
                .font(.title)
                .padding()
            
            Text(dish.describ ?? "")
            
            Spacer()
        }
        .padding()
        
        VStack {
            HStack(spacing: 20) {
                Button {
                    num += 1
                    print(num)
                } label: {
                    Image(systemName: "plus")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .foregroundColor(.white)
                        .frame(width: 25, height: 25)
                }
                Text(" \(String(num)) ")
                    .font(.title)
                    .foregroundColor(.white)
                Button {
                    num -= 1
                    print(num)
                } label: {
                    Image(systemName: "minus")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .foregroundColor(.white)
                        .frame(width: 25, height: 25)
                }
                .disabled(num <= 0)
            }
            
            Button {
                
            } label: {
                Text("Add for $\(dish.price!)")
                    .font(.title3)
                    .bold()
                    .foregroundColor(.white)
                    .padding(.horizontal)
            }
            .frame(width: 300)
            .background(Color.yellow)
            .cornerRadius(10)
        }
        .padding(.top, 25)
        .frame(maxWidth: .infinity)
        .background(Color(red: 0.29, green: 0.37, blue: 0.34, opacity: 1.00))
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(dish: Dish())
    }
}
