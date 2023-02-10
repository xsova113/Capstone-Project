//
//  FilterButton.swift
//  LittleLemon
//
//  Created by George Chang on 2023-02-10.
//

import SwiftUI

struct FilterButton: View {
    var filterType: String
    var body: some View {
        Button(filterType) {
            
        }
        .padding(.horizontal)
        .padding(.vertical, 8)
        .background(Color(red: 0.93, green: 0.94, blue: 0.93, opacity: 1.00))
        .cornerRadius(15)
        .foregroundColor(Color(red: 0.29, green: 0.37, blue: 0.34, opacity: 1.00))
        .fontWeight(.heavy)
        .font(Font.system(size: 12))
    }
}

struct FilterButton_Previews: PreviewProvider {
    static var previews: some View {
        FilterButton(filterType: "Starter")
    }
}
