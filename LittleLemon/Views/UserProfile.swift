//
//  UserProfile.swift
//  LittleLemon
//
//  Created by George Chang on 2023-02-09.
//

import SwiftUI

struct UserProfile: View {
    let firstName = UserDefaults.standard.string(forKey: kFirstName)
    let lastName = UserDefaults.standard.string(forKey: kLastName)
    let email = UserDefaults.standard.string(forKey: KEmail)
    @Environment(\.presentationMode) var isPresented
    
    var body: some View {
        VStack {
            Text("Personal information")
            Image("profile-image-placeholder")
                .padding()
            Text("First name: \(firstName ?? "")")
            Text("Last name: \(lastName ?? "")")
            Text("Email: \(email ?? "")")
            
            Button {
                UserDefaults.standard.set(false, forKey: kIsLoggedIn)
                self.isPresented.wrappedValue.dismiss()
            } label: {
                Text("Logout")
            }
            Spacer()

        }
        .padding()
    }
}

struct UserProfile_Previews: PreviewProvider {
    static var previews: some View {
        UserProfile()
    }
}
