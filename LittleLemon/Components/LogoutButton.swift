//
//  LogoutButton.swift
//  LittleLemon
//
//  Created by George Chang on 2023-02-09.
//

import SwiftUI

struct LogoutButton: View {
    var body: some View {
        Section {
            Text("Logout")
                .foregroundColor(.black)
                .fontWeight(.bold)
        }
        .frame(width: 100, height: 50)
        .background(Color(red: 0.96, green: 0.81, blue: 0.08, opacity: 1.00))
        .cornerRadius(12)
    }
}

struct LogoutButton_Previews: PreviewProvider {
    static var previews: some View {
        LogoutButton()
    }
}
