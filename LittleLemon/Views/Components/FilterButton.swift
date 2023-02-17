//
//  FilterButton.swift
//  LittleLemon
//
//  Created by George Chang on 2023-02-10.
//

import SwiftUI

struct FilterButton: View {
    
    @State private var selectedCategory: Category = Category.mains
    
    var body: some View {
        HStack {
//            ForEach(Category.allCases, id: \.self) { category in
//                Button(category.rawValue) {
//
//                }
//            }
//            .padding(.horizontal)
//            .padding(.vertical, 8)
//            .background(Color(red: 0.93, green: 0.94, blue: 0.93, opacity: 1.00))
//            .cornerRadius(15)
//            .foregroundColor(Color(red: 0.29, green: 0.37, blue: 0.34, opacity: 1.00))
//            .fontWeight(.heavy)
//            .font(Font.system(size: 12))
//            .padding(.horizontal, 5)
            Text("Select Category: ")
                .padding(.horizontal)
                .frame(width: 200, alignment: .leading)
            Picker("Category", selection: $selectedCategory) {
                ForEach(Category.allCases, id: \.self) { category in
                    Text(category.rawValue)
                }
            }
            .padding(.horizontal)
            .padding(.vertical, 8)
            .background(Color(red: 0.93, green: 0.94, blue: 0.93, opacity: 1.00))
            .cornerRadius(15)
            .foregroundColor(Color(red: 0.29, green: 0.37, blue: 0.34, opacity: 1.00))
          
            
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}

struct FilterButton_Previews: PreviewProvider {
    static var previews: some View {
        FilterButton()
    }
}
