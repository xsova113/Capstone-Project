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
        VStack(alignment: .center) {
            LogoView()
            
            VStack {
                Text("Personal information")
                    .font(.title)
                    .fontWeight(.bold)
                    .padding(.top, 50)
                Image("profile")
                    .padding()
                
                VStack(alignment: .leading) {
                    Text("First name: \(firstName ?? "")")
                        .padding()
                    Text("Last name: \(lastName ?? "")")
                        .padding()
                    Text("Email: \(email ?? "")")
                        .padding()
                }
                Spacer()
                Button {
                    UserDefaults.standard.set(false, forKey: kIsLoggedIn)
                    self.isPresented.wrappedValue.dismiss()
                } label: {
                    LogoutButton()
                }
            }

            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .padding()
            .overlay(RoundedRectangle(cornerRadius: 20).stroke(.gray, lineWidth: 1)  )
        }
        .padding()
    }
}

struct UserProfile_Previews: PreviewProvider {
    static var previews: some View {
        UserProfile()
    }
}
